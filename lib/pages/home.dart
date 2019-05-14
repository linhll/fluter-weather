import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_weather/services/weather_service.dart';
import 'package:the_weather/utils/util.dart';
import 'package:the_weather/widgets/forecast.dart';
import 'package:the_weather/widgets/head.dart';
import 'package:the_weather/utils/data.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StateHomePage();
}

class _StateHomePage extends State<HomePage> {
  Data data = new Data();
  List<Data> forecast = new List<Data>();

  void updateData() async {
    WeatherService.getInstance().getCurrent().then((value) {
      if (value != null && value != this.data) {
        setState(() {
          this.data = value;
        });
      }
    });

    WeatherService.getInstance().getForecast().then((values) {
      if (values.length > 0 && values != this.forecast) {
        setState(() {
          this.forecast = values;
        });
      }
    });
  }

  void _showSetting() {
    showDialog(
        context: context,
        builder: (buildContext) {
          return AlertDialog(
            title: Text("Notification"),
            content: Text("Comming soon!"),
            actions: [
              FlatButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var bg = isDay() ? "day_sky" : "night_sky";
    updateData();
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    // colorFilter: new ColorFilter.mode(
                    //     Colors.black.withOpacity(data.cloud.all / 200),
                    //     BlendMode.darken),
                    image: AssetImage("assets/$bg.png"),
                    fit: BoxFit.cover)),
            child: SafeArea(
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          _showSetting();
                        },
                        icon: Icon(
                          Icons.settings,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  HeadWidget(data),
                  ForecastWidget(forecast),
                ],
              ),
            )));
  }
}
