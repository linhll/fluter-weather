import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:the_weather/utils/coord.dart';
import 'dart:async';

class LocationService {
  static LocationService _instance;
  static LocationService getInstance() {
    return _instance != null
        ? _instance
        : (_instance = LocationService._internal());
  }

  bool needUpdate;
  Coord coord;

  LocationService._internal() {
    this.coord = new Coord();
    this.needUpdate = true;
    this.getLocation();
  }

  Future<Coord> getLocation() async {
    if (needUpdate) {
      var location = new Location();
      try {
        var result = await location.getLocation();
        this.coord.latitude = result.latitude;
        this.coord.longitude = result.longitude;
        this.needUpdate = false;
      } on PlatformException catch (e) {
        if (e.code == 'PERMISSION_DENIED') {
          //err("Permission denied");
        }
      }
    }
    return this.coord;
  }
}
