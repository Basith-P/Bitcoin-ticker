import 'package:flutter/material.dart';

import 'screens/price_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bitcoin Ticker',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.yellow,
        scaffoldBackgroundColor: Colors.grey[900],
      ),
      debugShowCheckedModeBanner: false,
      home: const PriceScreen(),
    );
  }
}


/*
semi conductor
ameter
multimeter
voltmeter
transistor
diode
*/