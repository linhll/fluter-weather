enum TemperatureUnit { celcius, fahrenheit, kelvin }

class Util {
  static const Map tempUnitMap = {
    TemperatureUnit.celcius: "",
    TemperatureUnit.fahrenheit: "",
    TemperatureUnit.kelvin: ""
  };

  static const Map tempSymbolMap = {
    TemperatureUnit.celcius: "",
    TemperatureUnit.fahrenheit: "",
    TemperatureUnit.kelvin: ""
  };
}

bool isDay() {
  var now = DateTime.now();
  return now.hour >= 6 && now.hour <= 18;
}
