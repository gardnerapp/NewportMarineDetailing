import 'package:flutter/material.dart';

class BookingFloatingAction extends StatelessWidget {
  final Function() onPressed;
  final IconData iconData;
  final Object heroTag;

  const BookingFloatingAction({
    super.key,
    required this.onPressed,
    required this.iconData,
    required this.heroTag
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: heroTag,
      onPressed: onPressed,
      backgroundColor: Colors.white,
      elevation: 20.0,
      splashColor: Colors.greenAccent,
      child: Icon(
        iconData, size: 35.0, color: Colors.lightBlueAccent,
      ),
    );
  }
}
