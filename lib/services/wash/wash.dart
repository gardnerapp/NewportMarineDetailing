import 'package:flutter/material.dart';

class WashPage extends StatefulWidget {
  const WashPage({super.key});

  @override
  State<WashPage> createState() => _WashPageState();
}

class _WashPageState extends State<WashPage> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTIme = TimeOfDay(hour: 07, minute: 00);
  late double cost; // cost per foot * boat length what does late do
  late String additionalInstructions;
  Map<String,double> services = {};

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("Wash")),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: const [
          SizedBox(height: 10),
          instructionText("Our washes typically take 2-3 hours\n"),
          instructionText("Discounts for daily, weekly and bi-weekly plans\n"),
          Divider(height: 20.0, thickness: 2.5, color: Colors.blueGrey),
          SizedBox(height: 15),
          Text("Which time and date works for you?",
          style: instructionTextStyle(),
          textAlign: TextAlign.center),
          SizedBox(height: 15.0,),
         // BookAppointmen(),
          SizedBox(height: 25),
          Divider(height: 20.0, thickness: 2.5, color: Colors.blue,),
          instructionText("Select your options: "),
          SizedBox(height: 20.0),

        ],
      ),
    );
  }
}
