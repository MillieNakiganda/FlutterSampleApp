import 'package:flutter/material.dart';
import 'package:flutter_sample/screens/bmi_screen.dart';
import 'package:flutter_sample/screens/intro_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      routes: {
        '/': (context) => const IntroScreen(),
        '/bmi': (context) => const BmiScreen()
      },
      initialRoute: '/',
    );
  }
}
