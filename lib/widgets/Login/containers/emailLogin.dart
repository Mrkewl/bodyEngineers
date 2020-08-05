import 'dart:ui';

import 'package:body_engineer/utils/formatter.dart';
import 'package:body_engineer/widgets/HomePage/index.dart';
import 'package:body_engineer/widgets/Login/authService.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/cupertino.dart';
//import 'package:flutter_icons/flutter_icons.dart';

class EmailLogin extends StatefulWidget {
  @override
  _EmailLoginState createState() => _EmailLoginState();
}

class _EmailLoginState extends State<EmailLogin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String error;
  String password = "";
  bool isWrongEmailPassword = false;
  String email = "";
  bool isSignInValid = false;

  String signUp_email = "";
  String signUp_password = "";
  String signUp_confirmPassword = "";
  String signUp_fname = "";
  String signUp_lname = "";
  //final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Column(children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Divider(
                color: Colors.black,
                endIndent: 10,
              ),
            ),
            Text("Or"),
            Expanded(
              child: Divider(
                color: Colors.black,
                indent: 10,
              ),
            ),
          ],
        ),
        Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            height: 155,
            child: Column(
              children: <Widget>[
                //sign in email
                Container(
                  height: 40,
                  child: TextField(
                    maxLines: 1,
                    decoration: InputDecoration(
                        labelText: 'Email Address',
                        prefixIcon: Icon(Icons.mail_outline),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18.0))),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      email = value;
                      isSignInDisabled();
                    },
                    textInputAction: TextInputAction.next,
                    onSubmitted: (_) => FocusScope.of(context).nextFocus(),
                  ),
                ),
                Spacer(),
                //sign in pw
                Container(
                  height: 40,
                  child: TextField(
                    maxLines: 1,
                    obscureText: true,
                    autocorrect: false,
                    textCapitalization: TextCapitalization.none,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock_outline),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        borderSide: (isWrongEmailPassword
                            ? BorderSide(color: Colors.red[600])
                            : BorderSide()),
                      ),
                    ),
                    onChanged: (value) {
                      password = value;
                      isSignInDisabled();
                    },
                    textInputAction: TextInputAction.done,
                    onSubmitted: (_) {
                      FocusScope.of(context).unfocus();
                      signIn();
                    },
                  ),
                ),
                //sign in button
                RaisedButton(
                    onPressed: isSignInValid ? signIn : null,
                    disabledColor: Colors.grey[400],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0)),
                    color: Colors.red[900],
                    elevation: 10,
                    child: Row(
                      children: <Widget>[
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          child: Icon(
                            Icons.mail_outline,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Sign in with Email",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    )),
              ],
            )),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("New User? "),
            InkWell(
              child: Text("Sign Up Here!",
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  )),
              onTap: () => {showSignUpForm(context)},
            )
          ],
        ))
      ]),
    );
  }

  void isSignInDisabled() =>
      isSignInValid = (isEmailValid(email) && isPasswordValid(password));

  bool isEmailValid(email) => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);

  bool isPasswordValid(password) {
    if (password.length < 8) {
      return false;
    }
    return true;
  }

  String validatePassword(password) {
    if (password.length < 8) {
      return "Password must be at least 8 letters";
    }
    return null;
  }

  String validateConfirmedPassword(passwordA, passwordB) {
    if (passwordA != passwordB) {
      return "Both password did not match.";
    }
    return null;
  }

  String validateBirthday(String birthday) {
    final format = "dd/MM/yyyy";
    print(isValidDateFormat(format, birthday));
    print(birthday);

    if (!isValidDateFormat(format, birthday)) {
      return "Invalid date";
    }
    return null;
  }

  void signIn() {
    if (isSignInValid) {
      AuthService().initiateEmailSignIn(
          email, password, onSignInSuccess, onSignInFailed);
    }
  }

  void signUp(email, password, fname, lname, dob) {
    print("signing up....");
  }

  void showSignUpForm(context) {
    FocusScopeNode _focusScopeNode = FocusScopeNode();
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
    final _confirmedPasswordController = TextEditingController();
    final _firstNameController = TextEditingController();
    final _lastNameController = TextEditingController();
    final _birthdayController = TextEditingController();

    FormState signUpForm = _formKey.currentState;

    void validateFormAndSignUp() {
      signUpForm = _formKey.currentState;
      if (signUpForm.validate()) {
        signUp(
            _emailController.text,
            _confirmedPasswordController.text,
            _firstNameController.text,
            _lastNameController.text,
            _birthdayController.text);
      }
    }

    var alertStyle = AlertStyle(
        animationType: AnimationType.fromBottom,
        animationDuration: Duration(milliseconds: 400),
        isCloseButton: true,
        isOverlayTapDismiss: false);

    Alert(
        context: context,
        style: alertStyle,
        title: "SIGN UP",
        content: Form(
            key: _formKey,
            child: FocusScope(
                node: _focusScopeNode,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(
                        height: 60,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 2.0, 0, 0),
                          child: TextFormField(
                            //autofocus: true,
                            maxLines: 1,
                            decoration: InputDecoration(
                                labelText: 'First Name',
                                helperText: '',
                                prefixIcon: Icon(Icons.person_outline),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18.0))),
                            keyboardType: TextInputType.text,
                            validator: (value) =>
                                (value.isNotEmpty || value != "")
                                    ? null
                                    : "First name cannot be empty",
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (_) {
                              _focusScopeNode.nextFocus();
                            },
                            controller: _firstNameController,
                          ),
                        )),
                    SizedBox(
                        height: 60,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 2.0, 0, 0),
                          child: TextFormField(
                            maxLines: 1,
                            decoration: InputDecoration(
                                labelText: 'Last Name',
                                helperText: '',
                                prefixIcon: Icon(Icons.person_outline),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18.0))),
                            keyboardType: TextInputType.text,
                            validator: (value) =>
                                (value.isNotEmpty || value != "")
                                    ? null
                                    : "Last name cannot be empty",
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (_) {
                              _focusScopeNode.nextFocus();
                            },
                            controller: _lastNameController,
                          ),
                        )),
                    SizedBox(
                        height: 60,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 2.0, 0, 0),
                          child: TextFormField(
                            textAlignVertical: TextAlignVertical.center,
                            maxLines: 1,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(10.0),
                                labelText: 'Birthday',
                                helperText: '',
                                hintStyle: TextStyle(height: 1),
                                hintText: "dd/mm/yyyy",
                                hintMaxLines: 1,
                                alignLabelWithHint: true,
                                prefixIcon: Icon(Icons.cake),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18.0))),
                            keyboardType: TextInputType.datetime,
                            validator: (value) =>
                                validateBirthday(_birthdayController.text),
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (_) {
                              _focusScopeNode.nextFocus();
                            },
                            onChanged: (value) => signUp_email = value,
                            controller: _birthdayController,
                          ),
                        )),
                    SizedBox(
                        height: 60,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 2.0, 0, 0),
                          child: TextFormField(
                            maxLines: 1,
                            decoration: InputDecoration(
                                labelText: 'Email Address',
                                helperText: '',
                                prefixIcon: Icon(Icons.mail_outline),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18.0))),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) =>
                                isEmailValid(value) ? null : "Email is invalid",
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (_) {
                              _focusScopeNode.nextFocus();
                            },
                            onChanged: (value) => signUp_email = value,
                            controller: _emailController,
                          ),
                        )),
                    SizedBox(
                        height: 60,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 2.0, 0, 0),
                          child: TextFormField(
                            maxLines: 1,
                            obscureText: true,
                            autocorrect: false,
                            decoration: InputDecoration(
                                labelText: 'Password',
                                helperText: '',
                                prefixIcon: Icon(Icons.lock_outline),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18.0))),
                            keyboardType: TextInputType.text,
                            validator: (value) => validatePassword(value),
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (_) {
                              _focusScopeNode.nextFocus();
                            },
                            controller: _passwordController,
                            onChanged: (value) => signUp_password = value,
                          ),
                        )),
                    SizedBox(
                        height: 60,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 2.0, 0, 0),
                          child: TextFormField(
                            maxLines: 1,
                            obscureText: true,
                            autocorrect: false,
                            decoration: InputDecoration(
                                labelText: 'Confirmed Password',
                                helperText: '',
                                prefixIcon: Icon(Icons.lock_outline),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18.0))),
                            keyboardType: TextInputType.text,
                            validator: (value) => validateConfirmedPassword(
                                _confirmedPasswordController.text,
                                _passwordController.text),
                            textInputAction: TextInputAction.done,
                            onFieldSubmitted: (_) {
                              _focusScopeNode.unfocus();
                              validateFormAndSignUp();
                            },
                            controller: _confirmedPasswordController,
                            onChanged: (value) =>
                                signUp_confirmPassword = value,
                          ),
                        )),
                  ],
                ))),
        buttons: [
          DialogButton(
              child: Text("Sign up"),
              onPressed: () {
                validateFormAndSignUp();
              })
        ]).show();
  }

  void onSignInSuccess() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => HomePage()));
  }

  void onSignInFailed(String message) {
    Alert(
        context: context,
        title: "Sign in failed",
        type: AlertType.warning,
        desc: message,
        buttons: [
          DialogButton(
              child: Text("okay"), onPressed: () => Navigator.pop(context))
        ]).show();
  }
}
