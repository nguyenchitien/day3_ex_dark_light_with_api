class Location {
  double latitude;
  double longitude;
  String country;

  Location({this.latitude, this.longitude});

  Location.fromJson(dynamic json) {
    country = json["country"];
    latitude = double.parse(json["coordinates"]["latitude"].toString());
    longitude = double.parse(json["coordinates"]["longitude"].toString());
  }
}
