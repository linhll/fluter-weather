import 'package:the_weather/utils/string.dart';

class Weather {
  num id;
  String main;
  String description;
  String icon;
  Weather() {
    this.id = 800;
    this.main = "--";
    this.description = "--";
    this.icon = "01d";
  }

  Weather.fromJson(Map json) {
    if (json != null) {
      this.id = json['id'];
      this.main = json['main'];
      this.description = StringUtil.capitalize(json['description']);
      this.icon = json['icon'];
    }
  }

  Map toJson() {
    return {'id': id, 'main': main, 'description': description, 'icon': icon};
  }
}
