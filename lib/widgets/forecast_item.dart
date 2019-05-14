import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_weather/pages/detail.dart';
import 'package:the_weather/theme/text.dart';
import 'package:the_weather/utils/data.dart';
import 'package:the_weather/utils/string.dart';

class ForecastItem extends StatelessWidget {
  final Data data;
  ForecastItem(this.data);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailWidget(this.data)),
          );
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 20, 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(StringUtil.getDateDM(data.time),
                      style: defaultTextStyle),
                  Text(StringUtil.getTimeHHMM(data.time),
                      style: defaultTextStyle),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/${data.weather.icon}.png"),
                  // ...
                ),
              ),
              width: 48,
              height: 48,
            ),
            Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "${data.weather.main}",
                        style: defaultTextStyle,
                      ),
                      Text(
                        "${data.weather.description}",
                        style: defaultTextStyle,
                      )
                    ],
                  ),
                )),
            Column(
              children: [
                Text(
                  "${data.main.temp.toInt()}\u00b0",
                  style: hugeTextStyle,
                )
              ],
            ),
          ],
        ));
  }
}
