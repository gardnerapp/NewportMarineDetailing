import 'package:flutter/material.dart';

TextStyle washCardStyle(){
  return const TextStyle(
      color: Colors.black87,
      fontSize: 20.0,
      fontWeight: FontWeight.w500
  );
}

TextStyle washCardSubtitle(){
  return const TextStyle(
      color: Colors.black87,
      fontSize: 16.0,
      fontWeight: FontWeight.w300
  );
}

class InstructionText extends StatelessWidget {
  final String instruction;
  const InstructionText({super.key, required this.instruction});

  @override
  Widget build(BuildContext context) {
    return Text(
      instruction, textAlign: TextAlign.left,
      style: const TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.w500
      ),
    );
  }
}
