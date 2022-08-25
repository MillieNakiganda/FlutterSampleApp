import 'package:flutter/material.dart';
import 'package:flutter_sample/shared/menu_bottom.dart';
import 'package:flutter_sample/shared/menu_drawer.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  final double fontsize = 18;
  String result = '';
  bool isMetric = true;
  bool isImperial = false;
  double? height;
  double? weight;
  late List<bool> isSelected;

  @override
  void initState() {
    isSelected = [isMetric, isImperial];
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('BMI Calculator')),
        drawer: const MenuDrawer(),
        bottomNavigationBar: const MenuBottom(),
        body: Column(
          children: [
            ToggleButtons(
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
          ],
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
}
