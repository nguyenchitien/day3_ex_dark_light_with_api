class UserDob {
  String date;
  int age;

  UserDob.fromJson(dynamic json) {
    date = json["date"];
    age = json["age"];
  }
}
