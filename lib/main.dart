import 'package:flutter/material.dart';
import 'package:newport_marine/services/wash/wash.dart';

import 'pages/homepage.dart';

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
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 20.0
          ),
        ),
        primaryColorLight: Colors.greenAccent,
        appBarTheme: const AppBarTheme(
          elevation: 20.0,
          color: Colors.greenAccent,
          centerTitle: true,
        ),
        primaryColor: Colors.greenAccent[200],
        visualDensity: VisualDensity.adaptivePlatformDensity,
        cardTheme: CardTheme(
          shadowColor: Colors.blueGrey,
          elevation: 8.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))
        ),
        drawerTheme: const DrawerThemeData(
          backgroundColor: Colors.white,
          elevation: 20.0,
          shadowColor: Colors.blue,
        )

      ),
      routes: {
        '/': (context) => const HomePage(),
        '/wash': (context) => const WashPage()
      },
      home: const HomePage()
    );
  }
}
