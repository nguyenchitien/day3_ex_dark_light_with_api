import 'package:day03_ex/model/user/location.dart';
import 'package:day03_ex/model/user/user_dob.dart';
import 'package:day03_ex/model/user/user_image.dart';
import 'package:day03_ex/model/user/user_name.dart';

class User {
  UserName name;
  String gender;
  Location location;
  String email;
  UserDob dob;
  String phone;
  UserPicture picture;

  User.fromJson(dynamic json) {
    name = UserName.fromJson(json["name"]);
    gender = json["gender"];
    location = Location.fromJson(json["location"]);
    email = json["email"];
    dob = UserDob.fromJson(json["dob"]);
    phone = json["phone"];
    picture = UserPicture.fromJson(json["picture"]);
  }
}
