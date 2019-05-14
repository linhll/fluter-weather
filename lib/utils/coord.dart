class Coord {
  double longitude;
  double latitude;

  Coord() {
    this.longitude = 0;
    this.latitude = 0;
  }

  Coord.fromJson(Map jsonMap) {
    if (jsonMap != null) {
      this.longitude = jsonMap['lon'];
      this.latitude = jsonMap['lat'];
    }
  }

  Map toJson() {
    return {"lon": this.longitude, "lat": this.latitude};
  }
}
