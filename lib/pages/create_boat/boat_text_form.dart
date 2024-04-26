import 'package:flutter/material.dart';

class BoatTextForm extends StatelessWidget {
  final String label;
  final Function(String val) onChanged;

  const BoatTextForm({
    super.key,
    required this.label,
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 15.0
      ),
      width: 400,
      child: TextFormField(
        decoration: textInputDecoration(label),
        onChanged: (val){
          onChanged(val);
        },
        validator: (val) => val != null? "Please enter !" : null,
      ),
    );
  }
}

textInputDecoration(String label){
  return InputDecoration(
    labelText: label,
    fillColor: Colors.white,
    filled: true,
    enabledBorder: formBorder(Colors.blue),
    focusedBorder: formBorder(Colors.greenAccent),
    errorBorder: formBorder(Colors.red),
    contentPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
    labelStyle: const TextStyle(
        color: Colors.black87, fontSize: 40.0
    ),
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
    color: Colors.black87, fontSize: 30.0, fontWeight: FontWeight.w400
  );
}
