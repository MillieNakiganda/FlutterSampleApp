import 'package:flutter/material.dart';
import 'package:flutter_sample/shared/menu_drawer.dart';

class Training extends StatelessWidget {
  const Training({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Training')),
      drawer: const MenuDrawer(),
      body: const Center(child: Text('Training')),
    );
  }
}
