import 'package:flutter/material.dart';
import 'package:the_weather/utils/data.dart';
import 'package:the_weather/theme/text.dart';
import 'package:the_weather/widgets/forecast_item.dart';

class ForecastWidget extends StatelessWidget {
  final List<Data> forecast;
  ForecastWidget(this.forecast);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: forecast.length * 2,
        itemBuilder: (context, i) {
          if (i.isOdd)
            return Divider(
              color: Color.fromARGB(00, 255, 255, 255),
            );
          final index = i ~/ 2;
          return ForecastItem(this.forecast[index]);
        },
      ),
    );
  }
}
