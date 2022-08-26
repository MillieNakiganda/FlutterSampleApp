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

  final TextEditingController txtPlace = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Weather')),
        drawer: const MenuDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(18),
          child: ListView(
            children: [
              Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    controller: txtPlace,
                    decoration: InputDecoration(
                        hintText: 'Enter a city',
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: getData,
                        )),
                  )),
              weatherRow('Place', weatherresult.name),
              weatherRow('Description', weatherresult.description),
              weatherRow(
                  'Temperature', weatherresult.temperature.toStringAsFixed(2)),
              weatherRow(
                  'Temperature', weatherresult.perceived.toStringAsFixed(2)),
              weatherRow('Pressure', weatherresult.pressure.toStringAsFixed(2)),
              weatherRow('humidity', weatherresult.humidity.toStringAsFixed(2)),
            ],
          ),
        ));
  }

  Future getData() async {
    HttpHelper helper = HttpHelper();
    weatherresult = await helper.getWeather(txtPlace.text);
    setState(() {});
  }

  Widget weatherRow(String label, String value) {
    Widget row = Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: [
            Expanded(
                flex: 3,
                child: Text(label,
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).hintColor,
                    ))),
            Expanded(
                flex: 4,
                child: Text(value,
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).primaryColor,
                    )))
          ],
        ));
    return row;
  }
}
