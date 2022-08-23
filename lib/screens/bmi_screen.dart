import 'package:flutter/material.dart';
import 'package:flutter_sample/shared/menu_drawer.dart';

class BmiScreen extends StatelessWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('BMI Calculator')),
        drawer: const MenuDrawer(),
        body: const Center(
          child: Text('BMI Calculator'),
        ));
  }
}