class UserPicture {
  String largeImg;
  String mediumImg;
  String thumbnailImg;

  UserPicture.fromJson(dynamic json) {
    largeImg = json["large"];
    mediumImg = json["medium"];
    thumbnailImg = json["thumbnail"];
  }
}
