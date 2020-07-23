import 'package:body_engineer/models/Account.dart';

class User {
  final String firstName;
  final String lastName;
  final DateTime dob;
  final Body body;
  final Account account;
  int age = 0;
  int bmi = 0;

  User({this.firstName, this.lastName, this.dob, this.body, this.account}) {
    this.age = getAge();
    this.bmi = getBMI();
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
  final int height;
  final int weight;
  final jointPains; //maps

  Body({this.height, this.weight, this.jointPains});
}
