import 'package:flutter/material.dart';
import 'package:flutter_sample/data/https_helper.dart';
import 'package:flutter_sample/shared/menu_drawer.dart';

class Weather extends StatefulWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  String result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weather')),
      drawer: const MenuDrawer(),
      body: Column(
        children: [
          ElevatedButton(onPressed: getData, child: const Text('Get Data')),
          Text(result),
        ],
      ),
    );
  }

  Future getData() async {
    HttpHelper helper = HttpHelper();
    result = await helper.getWeather('London');
    setState(() {});
  }
}
