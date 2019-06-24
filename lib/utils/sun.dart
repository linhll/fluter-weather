class Sun {
  DateTime sunrise;
  DateTime sunset;
  Sun() {
    sunrise = sunset = DateTime.fromMillisecondsSinceEpoch(0);
  }
  Sun.fromJson(Map map) {
    if (map != null && map['sunset'] != null && map['sunrise'] != null) {
      sunrise = DateTime.fromMillisecondsSinceEpoch(
          (map['sunrise'] * 1.0).round() * 1000);
      sunset = DateTime.fromMillisecondsSinceEpoch(
          (map['sunset'] * 1.0).round() * 1000);
    }
  }
  Map toJson() {
    return {
      'sunrise':
          sunrise == null ? sunrise : sunrise.millisecondsSinceEpoch / 1000,
      'sunset': sunset == null ? null : sunset.millisecondsSinceEpoch / 1000
    };
  }
}
