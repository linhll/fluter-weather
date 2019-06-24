class Main {
  num temp;
  num pressure;
  num humidity;
  num tempMin;
  num tempMax;

  Main() {
    this.temp = this.pressure = this.humidity = this.tempMax = this.tempMin = 0;
  }

  Main.fromJson(Map json) {
    if (json != null) {
      this.temp = json['temp'];
      this.pressure = json['presure'];
      this.humidity = json['humidity'];
      this.tempMin = json['temp_min'];
      this.tempMax = json['temp_max'];
    }
  }

  Map toJson() {
    return {
      'temp': temp,
      'presure': pressure,
      'humidity': humidity,
      'temp_max': tempMax,
      'temp_min': tempMin
    };
  }
}
