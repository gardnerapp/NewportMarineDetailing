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

textInputDecoration(String label){
  return InputDecoration(
    labelText: label,
    labelStyle: formTitleStyle(),
    fillColor: Colors.white,
    filled: true,
    enabledBorder: formBorder(Colors.blueGrey),
    focusedBorder: formBorder(Colors.greenAccent),
    errorBorder:  formBorder(Colors.red),
    contentPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0)
  );
}


OutlineInputBorder formBorder(Color color){
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(color: color, width: 3.0)
  );
}

TextStyle formTitleStyle(){
  return const TextStyle(
    color: Colors.black87,
    fontSize: 20.0,
      fontWeight: FontWeight.w400
  );
}