import 'package:flutter/material.dart';


AppBar customAppBar(String title){
  return AppBar(
    actions: [
      IconButton(
        icon: const Icon(
            Icons.directions_boat, size: 40.0,
            color: Colors.blue
        ),
        splashColor: Colors.greenAccent,
        onPressed: (){},
      )
    ],
    title: Text(title),
  );
}