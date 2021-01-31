class UserName {
  String lastName;
  String firstName;

  UserName.fromJson(dynamic json) {
    lastName = json["last"];
    firstName = json["first"];
  }

  @override
  String toString() {
    
    return "$firstName $lastName";

  }
}
