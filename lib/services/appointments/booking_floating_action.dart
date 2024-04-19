import 'package:flutter/material.dart';

class BookingFloatingAction extends StatelessWidget {
  final Function onPressed;
  final IconData iconData;
  final Object heroTag;

  const BookingFloatingAction({super.key,
    required this.onPressed,
    required this.iconData,
    required this.heroTag});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: heroTag,
      onPressed: () => {}, // TOdo get a way to pass function towidget
      backgroundColor: Colors.greenAccent,
      elevation: 20.0,
      splashColor: Colors.lightBlue,
      child: Icon(
        iconData, size: 35.0, color: Colors.lightBlueAccent[200],
      ),
    );
  }
}
