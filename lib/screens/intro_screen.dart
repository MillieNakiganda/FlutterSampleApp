import 'package:flutter/material.dart';
import 'package:flutter_sample/shared/menu_drawer.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Naki Fitness')),
      drawer: const MenuDrawer(),
      body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/beach.jpg'),
            fit: BoxFit.cover,
          )),
          child: Center(
              child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white70,
                  ),
                  child: const Text(
                    'Commit to be fit, Care to be great',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22, shadows: [
                      Shadow(
                          offset: Offset(1.0, 1.0),
                          blurRadius: 2.0,
                          color: Colors.grey)
                    ]),
                  )))),
    );
  }
}
