import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

import 'package:http/http.dart' as http;
import 'package:the_weather/services/location.dart';
import 'package:the_weather/utils/coord.dart';
import 'package:the_weather/utils/data.dart';

class WeatherService {
  static WeatherService _instance;
  static WeatherService getInstance() {
    return _instance != null
        ? _instance
        : (_instance = WeatherService._internal());
  }

  final baseUrl = "http://api.openweathermap.org/data/2.5/";
  final _apiKeys = [
    "0ef77c6445ae7e7eb8696e0beea4d51f",
    "1bf2c5fcc6e4ed14eaf9c322741c29a3"
  ];
  final _fileWeatherCache = "weather";
  final _fileForecastCache = "forecasts";

  int _key = 0;

  Data _data;
  List<Data> _forecasts;

  DateTime lastFetch = DateTime.fromMillisecondsSinceEpoch(0);

  WeatherService._internal() {
    this._forecasts = new List<Data>();
  }
  bool _needRefresh() {
    var delta = DateTime.now().millisecondsSinceEpoch -
        this.lastFetch.millisecondsSinceEpoch;
    return delta >= Duration.millisecondsPerHour;
  }

  Future<Data> getCurrent() async {
    if (this._data == null) {
      await _loadCache();
    }
    if (_needRefresh()) {
      await _refresh();
    }
    return this._data;
  }

  Future<List<Data>> getForecast() async {
    if (_forecasts.length == 0 || _needRefresh()) {
      await _loadCache();
    }
    if (_needRefresh()) {
      await _refresh();
    }
    return this._forecasts;
  }

  Future<void> _refresh() async {
    var coord = await LocationService.getInstance().getLocation();
    var url = generateUrl(coord, DataType.weather);
    var response = await http.get(url);
    bool isSuccess = false;

    if (response.statusCode == 200) {
      this._data = Data.fromJson(response.body);
      isSuccess = true;
    } else {
      isSuccess = false;
    }

    url = generateUrl(coord, DataType.forecast);
    response = await http.get(url);
    if (response.statusCode == 200) {
      var decoded = jsonDecode(response.body);
      var list = decoded["list"] as List;
      var datalist = new List<Data>();
      list.forEach((e) {
        var data = Data.fromMap(e);
        data.name = decoded["city"]["name"];
        datalist.add(data);
      });
      this._forecasts = datalist;
    } else {
      isSuccess = false;
    }

    if (isSuccess) {
      this.lastFetch = DateTime.now();
      _cache();
    } else {
      _key++;
      if (_key < _apiKeys.length) {
        await _refresh();
      } else {
        _key = 0;
      }
    }
  }

  Future<void> _loadCache() async {
    final directory = (await getTemporaryDirectory()).path;
    final weatherFile = new File(directory + "/" + _fileWeatherCache);
    if (weatherFile.existsSync()) {
      var content = weatherFile.readAsStringSync();
      this._data = Data.fromJson(content);
      if (this._data != null) {
        this.lastFetch = this._data.time;
      }
    }

    final forecastFile = new File(directory + "/" + _fileForecastCache);
    if (forecastFile.existsSync()) {
      var contents = forecastFile.readAsStringSync();
      var list = jsonDecode(contents);
      var datalist = new List<Data>();
      list.forEach((e) => datalist.add(Data.fromMap(e)));
      this._forecasts = datalist;
    }
  }

  Future<void> _cache() async {
    final directory = (await getTemporaryDirectory()).path;
    final weatherFile = new File(directory + "/" + _fileWeatherCache);
    var content = jsonEncode(this._data);
    weatherFile.writeAsString(content);

    final forecastFile = new File(directory + "/" + _fileForecastCache);
    var contents = jsonEncode(this._forecasts);
    forecastFile.writeAsString(contents);
  }

  String generateUrl(Coord coord, DataType type) {
    return "$baseUrl${type.toString().split('.')[1]}?" +
        "lon=${coord.longitude}&lat=${coord.latitude}&appid=${_apiKeys[_key]}&units=metric" +
        "&lang=vi";
  }
}

enum DataType { weather, forecast }
