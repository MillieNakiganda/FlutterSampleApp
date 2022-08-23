import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Naki Fitness')),
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
      ),
    );
  }
}
