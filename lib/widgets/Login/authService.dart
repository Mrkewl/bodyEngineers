import 'package:body_engineer/widgets/Login/containers/facebookLogin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

/**
 * This is the firebase authentication service designed to be a singleton.
 */
class AuthService {
  // hold the instance of the authenticated user
  loginType type;
  FirebaseUser _user;
  AuthCredential _credential;
  final FacebookLogin _facebookLogin = FacebookLogin();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  static final AuthService _singletonInstance =
      AuthService._privateConstructor();

  factory AuthService() {
    return _singletonInstance;
  }

  AuthService._privateConstructor();

  Future<bool> isAlreadySignedIn() async {
    bool isSignedInGoogle = await _googleSignIn.isSignedIn();
    bool isSignedInFaceBook = await _facebookLogin.isLoggedIn;
    bool isSignedInEmail = true;

    // _user = await _auth.currentUser();
    // return false;

    _user = await _auth.currentUser();
    if (_user == null) {
      return false;
    } else {
      if (isSignedInGoogle) {
        type = loginType.google;
        return true;
      } else if (isSignedInFaceBook) {
        type = loginType.facebook;
        return true;
      } else if (isSignedInEmail) {
        type = loginType.email;
        return true;
      }
    }
    return false;
  }

  void initiateGoogleLogin(onSuccess) async {
    //https://medium.com/flutter-community/authenticate-with-a-gmail-account-in-your-flutter-apps-using-firebase-authentication-9cbf95796157

    // flag to check whether we're signed in already
    bool isSignedIn = await _googleSignIn.isSignedIn();
    if (isSignedIn) {
      // if so, return the current user
      type = loginType.google;
      _user = await _auth.currentUser();
    } else {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      // get the credentials to (access / id token)
      // to sign in via Firebase Authentication
      _credential = GoogleAuthProvider.getCredential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      _user = (await _auth.signInWithCredential(_credential)).user;
      type = loginType.google;
      onSuccess();
    }
  }

  void initiateFacebookLogin(onSuccess, alertCallback) async {
    _facebookLogin.loginBehavior = FacebookLoginBehavior.webViewOnly;
    var facebookLoginResult =
        await _facebookLogin.logInWithReadPermissions(['email']);
    switch (facebookLoginResult.status) {
      case FacebookLoginStatus.error:
        alertCallback(
            "An error occured during login. Error: ${facebookLoginResult.errorMessage}");
        break;
      case FacebookLoginStatus.cancelledByUser:
        break;
      case FacebookLoginStatus.loggedIn:
        _credential = FacebookAuthProvider.getCredential(
            accessToken: facebookLoginResult.accessToken.token);
        _user = (await _auth.signInWithCredential(_credential)).user;
        onSuccess();
        break;
    }
  }

  void initiateEmailSignIn(
      username, password, onSuccess, onFailCallback) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: username, password: password);
      _user = result.user;
      type = loginType.email;
      onSuccess();
    } catch (e) {
      print(e);
      print(e.code);
      switch (e.code) {
        case "ERROR_INVALID_EMAIL":
        case "ERROR_WRONG_PASSWORD":
        case "ERROR_USER_NOT_FOUND":
          print("err");
          onFailCallback("Invalid email or password.");
          break;
        case "ERROR_USER_DISABLED":
          onFailCallback("This account has been disabled.");
          break;
        case "ERROR_TOO_MANY_REQUESTS":
          onFailCallback("Too many requests. Try again later.");
          break;
        case "ERROR_OPERATION_NOT_ALLOWED":
          onFailCallback(
              "Signing in with Email and Password is not enabled. Pls contact admin");
          break;
        default:
          onFailCallback("An undefined Error happened.");
      }
    }
  }

  Future<Null> authSignOut() async {
    switch (this.type) {
      case loginType.facebook:
        await _facebookLogin.logOut();
        break;
      case loginType.google:
        await _googleSignIn.signOut();
        break;
      case loginType.email:
        break;
    }
    _auth.signOut();
    //@TODO
    //continue flow of loggin out
    //clear local db?
  }
}

enum loginType { facebook, google, email }
