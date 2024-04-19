import 'package:flutter/material.dart';
import 'package:newport_marine/services/appointments/book_appointment.dart';
import '../styles.dart';

class WashPage extends StatefulWidget {
  const WashPage({super.key});

  @override
  State<WashPage> createState() => _WashPageState();
}

class _WashPageState extends State<WashPage> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = const TimeOfDay(hour: 07, minute: 00);
  late double cost; // cost per foot * boat length what does late do
  late String additionalInstructions;
  Map<String,double> services = {};

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("Wash")),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          const SizedBox(height: 10),
          const InstructionText(
              instruction: "Our washes typically take 2-3 hours.\n"),
          const InstructionText(
              instruction: "Discounts for daily, weekly and biweekly wash plans !\n"),
          const Divider(height: 10.0, thickness: 2.5, color: Colors.blue),
          const SizedBox(height: 20),
          const InstructionText(instruction: "When would you like your wash?\n"),
          const SizedBox(height: 10.0,),
          BookAppointment(
              handleDateChange: (DateTime date) => setState(() => selectedDate = date),
              handleTImeChange: (TimeOfDay time) => setState(() => selectedTime = time),
          ),
          const SizedBox(height: 25),
          const Divider(height: 20.0, thickness: 2.5, color: Colors.blue,),
        //  instructionText("Select your options: "),
          const SizedBox(height: 20.0),

        ],
      ),
    );
  }
}
