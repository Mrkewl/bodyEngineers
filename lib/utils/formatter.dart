import 'package:intl/intl.dart';

// yMd -> 7/10/1996
bool isValidDateFormat(String format, dateTimeStr) {
  DateFormat f = new DateFormat(format);
  try {
    print(f.parseStrict(dateTimeStr.toString()));
    return true;
  } on FormatException {
    return false;
  }
}

DateTime stringToDateTime(String format, String dateTimeStr) {
  DateFormat f = new DateFormat(format);
  List<String> date = dateTimeStr.split('/');
  try {
    return f.parse(dateTimeStr);
  } on FormatException {
    return null;
  }
}
