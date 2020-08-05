import 'package:body_engineer/models/Account.dart';

class User {
  String firstName;
  String lastName;
  DateTime dob;
  Body body;
  Account account;
  int age = 0;
  int bmi = 0;

  User({this.firstName, this.lastName, this.dob, this.body, this.account}) {
    this.age = getAge();
    this.bmi = getBMI();
  }

  User.initialState() {
    this.firstName = "";
    this.lastName = "";
    this.dob = new DateTime.now();
    this.body = Body.initialState();
    this.account = Account.initialState();
  }

  getAge() {
    if (this.dob != null) {
      var now = new DateTime.now();
      Duration diff = this.dob.difference(now);
      return diff.inDays / 365;
    }
    return 0;
  }

  getBMI() {
    var height = this.body.height;
    var weight = this.body.weight;
    if (height > 0 && weight > 0) {
      return weight / (height * height);
    }
    return 0;
  }
}

class Body {
  int height;
  int weight;
  JointPains jointPains;

  Body({this.height, this.weight, this.jointPains});

  Body.initialState() {
    this.height = 0;
    this.weight = 0;
    this.jointPains = JointPains.initialState();
  }
}

class JointPains {
  Map shoulder;
  Map elbow;
  Map wrist;
  Map waist;
  Map knee;
  Map ankle;

  JointPains(
      {this.shoulder,
      this.elbow,
      this.wrist,
      this.waist,
      this.knee,
      this.ankle});

  //named constructor
  JointPains.initialState() {
    //the default value for all symetrical parts
    Map _default = {"left": false, "right": false};
    this.shoulder = _default;
    this.elbow = _default;
    this.wrist = _default;
    this.waist = _default;
    this.knee = _default;
    this.ankle = _default;
  }
}
