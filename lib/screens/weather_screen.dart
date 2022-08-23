import 'package:flutter/material.dart';
import 'package:flutter_sample/shared/menu_drawer.dart';

class Weather extends StatelessWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weather')),
      drawer: const MenuDrawer(),
      body: const Center(child: Text('Weather')),
    );
  }
}
