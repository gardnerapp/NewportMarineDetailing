import 'package:flutter/material.dart';

class FormSubmitBtn extends StatelessWidget {
  final String label;
  final Function() onPressed;
  final Icon icon;

  const FormSubmitBtn({
    super.key,
    required this.label,
    required this.onPressed,
    required this.icon});

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonalIcon(
        onPressed: onPressed,
        icon: icon,
        label: Text(label,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 30.0)
        ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shadowColor: Colors.blue,
        elevation: 20.0,
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)
        ),
      )
    );
  }
}
