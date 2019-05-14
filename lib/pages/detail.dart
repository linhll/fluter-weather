import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:the_weather/utils/data.dart';
import 'package:the_weather/utils/util.dart';
import 'package:the_weather/theme/text.dart';

class DetailWidget extends StatelessWidget {
  final Data data;
  DetailWidget(this.data);

  @override
  Widget build(BuildContext context) {
    var bg = isDay() ? "day_sky" : "night_sky";
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/$bg.png"), fit: BoxFit.cover)),
        child: SafeArea(
            child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text("${data.main.temp}\u00b0",
                        style: temperatureTextStyle),
                  ),
                ],
              ),
              Text(
                "${data.name}",
                style: largeTextStyle,
              ),
            ],
          ),
        )),
      ),
    );
  }
}
