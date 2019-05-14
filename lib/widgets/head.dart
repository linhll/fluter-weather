import 'package:flutter/material.dart';
import 'package:the_weather/pages/detail.dart';
import 'package:the_weather/utils/data.dart';
import 'package:the_weather/theme/text.dart';
import 'package:the_weather/utils/string.dart';

class HeadWidget extends StatelessWidget {
  final Data data;

  HeadWidget(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
        child: Center(
          child: Column(
            children: [
              Text(
                data.name,
                style: cityNameStyle,
                textAlign: TextAlign.center,
              ),
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/${data.weather.icon}.png"),
                      fit: BoxFit.cover),
                ),
                width: 64,
                height: 64,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  data.weather.description,
                  style: defaultTextStyle,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${data.main.temp}\u00b0",
                        style: temperatureTextStyle),
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 120),
                  child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailWidget(this.data)),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(StringUtil.getTimeHHMM(data.time),
                                    style: defaultTextStyle),
                                Text("Gió: ${data.wind.speed} m/s",
                                    style: defaultTextStyle),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Min: ${data.main.tempMin}\u00b0",
                                      style: defaultTextStyle),
                                  Text("Max: ${data.main.tempMax}\u00b0",
                                      style: defaultTextStyle),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )))
            ],
          ),
        ));
  }
}
