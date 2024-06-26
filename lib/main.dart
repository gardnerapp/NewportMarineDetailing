import 'package:flutter/material.dart';
import 'package:newport_marine/pages/create_boat/create_boat.dart';
import 'package:newport_marine/pages/error_page.dart';
import 'package:newport_marine/services/dockside.dart';
import 'package:newport_marine/services/full_detail.dart';
import 'package:newport_marine/services/wash/wash.dart';

import 'pages/homepage.dart';

//Todo put up help pg w mailer
// todo api call b4 push to confirm
// screenshots, upload
//
// TODO add icon logo
// todo create help page



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    // Reusable appbar Icon Themes
    const appBarIconTheme =  IconThemeData(
        size: 30.0,
        color: Colors.blue
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Newport Marine Detailing',
      theme: ThemeData(
          primaryColorLight: Colors.greenAccent,
          textTheme: const TextTheme(
          bodyMedium: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w300,
          ),
          titleLarge: TextStyle(
            fontSize: 20.0
          ),
        ),
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          actionsIconTheme: appBarIconTheme,
          iconTheme: appBarIconTheme,
          elevation: 16.0,
          shadowColor: Colors.greenAccent,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.0,
            color: Colors.black
          )
        ),
        primaryColor: Colors.greenAccent[200],
        visualDensity: VisualDensity.adaptivePlatformDensity,
        cardTheme: CardTheme(
          shadowColor: Colors.blueGrey,
          elevation: 16.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))
        ),
        drawerTheme: const DrawerThemeData(
          backgroundColor: Colors.white,
          elevation: 20.0,
          shadowColor: Colors.blue,
        )
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/create_boat': (context) => const CreateBoat(),
        '/wash': (context) => const WashPage(),
        '/full_detail': (context) => const FullDetail(),
        '/dockside': (context) => const Dockside(),
        '/error': (context) => const ErrorPage(),
      },
    );
  }
}
