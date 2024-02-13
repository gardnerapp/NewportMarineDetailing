import 'package:flutter/material.dart';

import 'homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Newport Marine Detailing',
      theme: ThemeData(
        primaryColorLight: Colors.greenAccent,
        appBarTheme: const AppBarTheme(
          elevation: 16.0,
          color: Colors.greenAccent,
          centerTitle: true,
        ),
        primaryColor: Colors.greenAccent[200],
        visualDensity: VisualDensity.adaptivePlatformDensity,
        cardTheme: CardTheme(
          shadowColor: Colors.blueGrey,
          elevation: 8.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))
        )

      ),
      home: const HomePage()
    );
  }
}
