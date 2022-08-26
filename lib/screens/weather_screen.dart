import 'package:flutter/material.dart';
import 'package:flutter_sample/data/http_helper.dart';
import 'package:flutter_sample/shared/menu_drawer.dart';

import '../data/weather.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherState();
}

class _WeatherState extends State<WeatherScreen> {
  Weather weatherresult = Weather(
      name: '',
      description: '',
      temperature: 0,
      perceived: 0,
      pressure: 0,
      humidity: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weather')),
      drawer: const MenuDrawer(),
      body: Column(
        children: [
          ElevatedButton(onPressed: getData, child: const Text('Get Data')),
          Text(weatherresult.name),
        ],
      ),
    );
  }

  Future getData() async {
    HttpHelper helper = HttpHelper();
    weatherresult = await helper.getWeather('London');
    setState(() {});
  }
}
