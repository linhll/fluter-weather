class Wind {
  num speed;
  num deg;
  num gust;

  Wind() {}

  Wind.fromJson(Map json) {
    if (json != null) {
      this.speed = json['speed'];
      this.deg = json['deg'];
      this.gust = json['gust'];
    }
  }

  Map toJson() {
    return {'speed': speed, 'deg': deg, 'gust': gust};
  }
}
