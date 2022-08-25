import 'package:flutter/material.dart';
import 'package:flutter_sample/shared/menu_bottom.dart';
import 'package:flutter_sample/shared/menu_drawer.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  final TextEditingController txtHeight = TextEditingController();
  final TextEditingController txtWeight = TextEditingController();
  final double fontsize = 18;
  String result = '';
  bool isMetric = true;
  bool isImperial = false;
  double? height;
  double? weight;
  late List<bool> isSelected;
  late String heightMessage;
  late String weightMessage;

  @override
  void initState() {
    isSelected = [isMetric, isImperial];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    heightMessage =
        'Please insert your height in ${isMetric ? 'meters' : 'inches'}';
    weightMessage =
        'Please insert your weight in ${isMetric ? 'kilos' : 'pounds'}';
    return Scaffold(
        appBar: AppBar(title: const Text('BMI Calculator')),
        drawer: const MenuDrawer(),
        bottomNavigationBar: const MenuBottom(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: ToggleButtons(
                    isSelected: isSelected,
                    onPressed: toggleMeasure,
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            'Metric',
                            style: TextStyle(fontSize: fontsize),
                          )),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            'Imperial',
                            style: TextStyle(fontSize: fontsize),
                          ))
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: TextField(
                    controller: txtHeight,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(hintText: heightMessage)),
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: TextField(
                    controller: txtWeight,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(hintText: weightMessage)),
              ),
              ElevatedButton(
                  onPressed: findBmi,
                  child: Text('Calculate BMI',
                      style: TextStyle(fontSize: fontsize))),
              Text(result, style: TextStyle(fontSize: fontsize))
            ],
          ),
        ));
  }

  void toggleMeasure(value) {
    if (value == 0) {
      isMetric = true;
      isImperial = false;
    } else {
      isMetric = false;
      isImperial = true;
    }
    setState(() {
      isSelected = [isMetric, isImperial];
    });
  }

  void findBmi() {
    double bmi = 0;
    double height = double.tryParse(txtHeight.text) ?? 0;
    double weight = double.tryParse(txtWeight.text) ?? 0;

    if (isMetric) {
      bmi = weight / (height * height);
    } else {
      bmi = weight * 703 / (height * height);
    }

    setState(() {
      result = 'Your BMI is ${bmi.toStringAsFixed(2)}';
    });
  }
}
