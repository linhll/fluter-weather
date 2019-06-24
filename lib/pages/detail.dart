import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:the_weather/utils/data.dart';
import 'package:the_weather/utils/util.dart';
import 'package:the_weather/theme/text.dart';
import 'package:the_weather/utils/string.dart';

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
          padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                  ),
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${data.main.temp.toStringAsFixed(1)}\u00b0",
                              style: cityNameStyle),
                          Text(
                              "${data.main.tempMin.toInt().toStringAsFixed(1)}\u00b0 - " +
                                  "${data.main.tempMax.toStringAsFixed(1)}\u00b0",
                              style: defaultTextStyle),
                        ],
                      )),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage("assets/${data.weather.icon}.png"),
                              fit: BoxFit.contain),
                        ),
                        width: 48,
                        height: 48,
                      ),
                      Text("${data.weather.description}",
                          style: defaultTextStyle),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                  ),
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${data.name}", style: largeTextStyle),
                          Text(
                            "${StringUtil.getDateTimehhmmDDMMYYYY(data.time)}",
                            style: defaultTextStyle,
                          )
                        ],
                      )),
                ],
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/wind.png"),
                          fit: BoxFit.contain),
                    ),
                    width: 48,
                    height: 48,
                  ),
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Gió: ${data.wind.speed} m/s",
                              style: defaultTextStyle),
                          Text(
                              "Hướng: N/A", // Text("Hướng: ${data.wind.deg ?? 'N/A'}",
                              style: defaultTextStyle),
                        ],
                      )),
                ],
              ),
              Row(
                children: [
                  Container(
                    // decoration: BoxDecoration(
                    //   image: DecorationImage(
                    //       image: AssetImage("assets/wind.png"),
                    //       fit: BoxFit.contain),
                    // ),
                    width: 48,
                    height: 48,
                  ),
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Độ ẩm: ${data.main.humidity} %",
                              style: defaultTextStyle),
                          Text(
                              "Áp suất: ${data.main.pressure ?? 'N/A'} hPa", // Text("Hướng: ${data.wind.deg ?? 'N/A'}",
                              style: defaultTextStyle),
                        ],
                      )),
                ],
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/01d.png"),
                          fit: BoxFit.contain),
                    ),
                    width: 48,
                    height: 48,
                  ),
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "Mọc: ${data.sys != null ? StringUtil.getTimehhmm(data.sys.sunrise) : 'N/A'}",
                              style: defaultTextStyle),
                          Text(
                              "Lặn:  ${data.sys != null ? StringUtil.getTimehhmm(data.sys.sunset) : 'N/A'}",
                              style: defaultTextStyle),
                        ],
                      )),
                ],
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/rain.png"),
                          fit: BoxFit.contain),
                    ),
                    width: 48,
                    height: 24,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                        "Lượng mưa: ${data.rain != null ? data.rain['3h'] : 'N/A'} mm",
                        style: defaultTextStyle),
                  ),
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }
}
