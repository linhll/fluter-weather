import 'package:the_weather/utils/cloud.dart';
import 'package:the_weather/utils/coord.dart';
import 'package:the_weather/utils/main.dart';
import 'package:the_weather/utils/sun.dart';
import 'package:the_weather/utils/weather.dart';
import 'package:the_weather/utils/wind.dart';
import 'dart:convert';

class Data {
  Coord coord;
  Weather weather;
  Main main;
  Wind wind;
  String name;
  String id;
  Cloud cloud;
  DateTime time;
  Sun sys;
  Map rain;

  Data() {
    coord = new Coord();
    weather = new Weather();
    main = new Main();
    wind = new Wind();
    cloud = new Cloud();
    name = "--";
    time = DateTime.fromMillisecondsSinceEpoch(0);
  }
  Data.fromJson(String json) {
    Map jsonDecoded = jsonDecode(json);
    _copy(Data.fromMap(jsonDecoded));
  }

  Data.fromMap(Map map) {
    this.coord = Coord.fromJson(map['coord']);
    this.name = map['name'];
    this.main = Main.fromJson(map['main']);
    this.weather = Weather.fromJson(map['weather'][0]);
    this.wind = Wind.fromJson(map['wind']);
    this.time =
        DateTime.fromMillisecondsSinceEpoch((map['dt'] * 1.0).round() * 1000);
    this.cloud = Cloud.fromJson(map['clouds']);
    var sys = Sun.fromJson(map['sys']);
    if (sys != null && sys.sunset != null && sys.sunrise != null) {
      this.sys = sys;
    } else {
      this.sys = null;
    }
    this.rain = map['rain'];
  }

  Map toJson() {
    return {
      "coord": this.coord.toJson(),
      "name": this.name,
      "main": this.main.toJson(),
      "weather": [this.weather.toJson()],
      "wind": this.wind.toJson(),
      "dt": this.time.millisecondsSinceEpoch / 1000,
      "clouds": this.cloud.toJson(),
      "sys": this.sys == null ? null : this.sys.toJson(),
      "rain": this.rain ?? null,
    };
  }

  _copy(Data other) {
    this.coord = other.coord;
    this.name = other.name;
    this.main = other.main;
    this.weather = other.weather;
    this.wind = other.wind;
    this.time = other.time;
    this.cloud = other.cloud;
    this.sys = other.sys;
    this.rain = other.rain;
  }
}
