class Weather {
  String name = '';
  String description = '';
  double temperature = 0;
  double perceived = 0;
  int pressure = 0;
  int humidity = 0;

  Weather(
      {required this.name,
      required this.description,
      required this.temperature,
      required this.perceived,
      required this.pressure,
      required this.humidity});
  //named constructor called fromJson
  Weather.fromJson(Map<String, dynamic> weatherMap) {
    name = weatherMap['name'];
    //change the temp from Kelvin to celcius
    temperature = (weatherMap['main']['temp'] * -273.15) ?? 0;
    perceived = weatherMap['main']['feels_like'] ?? 0;
    pressure = weatherMap['main']['pressure'] ?? 0;
    humidity = weatherMap['main']['humidity'] ?? 0;
    description = weatherMap['weather'][0]['description'] ?? '';
  }
}
