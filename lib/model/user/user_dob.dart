import 'package:intl/intl.dart';

class UserDob {
  String date;
  int age;

  UserDob.fromJson(dynamic json) {
    date = json["date"];
    age = json["age"];
  }

  @override
  String toString() {
    var inputFormat = DateFormat('yyyy-dd-MM');
    var inputDate =
        inputFormat.parse(date.substring(0, 10)); // <-- Incoming date

    var outputFormat = DateFormat('dd/MM/yyyy');
    var outputDate = outputFormat.format(inputDate); // <-- Desired date

    return outputDate;
  }
}
