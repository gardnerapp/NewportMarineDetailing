import 'package:flutter/material.dart';
import 'package:newport_marine/services/styles.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/form_submit_btn.dart';
import '../pages/confirmation/confirmation.dart';
import 'appointments/book_appointment.dart';

class Dockside extends StatefulWidget {
  const Dockside({super.key});

  @override
  State<Dockside> createState() => _DocksideState();
}

class _DocksideState extends State<Dockside> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = const TimeOfDay(hour: 07, minute: 00);
  double cost = 1;
  late String additionalInstructions = '';
  Map<String,dynamic> services = {};

  Map<String,dynamic> boatDetails = {};
  @override
  Widget build(BuildContext context) {

    getBoat();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dock Side"),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(20.0),
          children: [
            const SizedBox(height: 10.0),

            const InstructionText(instruction: "Please include the number of deck hands you will need\n"),

            const InstructionText(instruction: "and the time of your arrival/departure\n"),

            const Divider(height: 20.0, thickness: 2.5, color: Colors.blue),

            const SizedBox(height: 15.0),

            const InstructionText(instruction: "Arrival/Departure Time:\n"),

            const SizedBox(height: 15.0),

            BookAppointment(
              handleDateChange: (DateTime date) => setState(() => selectedDate = date),
              handleTImeChange: (TimeOfDay time) => setState(() => selectedTime = time),
            ),

            const Divider(height: 20.0, thickness: 2.5, color: Colors.blue),

            const SizedBox(height: 15.0),

            const InstructionText(instruction: "Number of Deck Hands:\n"),

            const SizedBox(height: 15.0),

            NumberPicker(
              value: 1,
              minValue: 1,
              maxValue: 10,
              step: 10,
              haptics: true,
              onChanged: (val) => setState(() => services['Deck Hands'] = val as double),
            ),

            TextFormField(
              decoration: textInputDecoration("Supply restock ? Please specify"),
              onChanged: (val){
                setState(() {
                  services['Supply Restock'] = val;
                });
              },
            ),

            TextFormField(
              decoration: textInputDecoration("Anything Else ?"),
              onChanged: (val){
                setState(() {
                  additionalInstructions = val;
                });
              },
            ),

            const SizedBox(height: 25.0),

            TextFormField(
              decoration: textInputDecoration("Anything Else ?"),
              onChanged: (val){
                setState(() {
                  additionalInstructions = val;
                });
              },
            ),

            FormSubmitBtn(
                label: "Dock Side",
                icon: const Icon(
                    Icons.directions_boat,
                    size: 40.0,
                    color: Colors.lightBlueAccent),
                onPressed: () {
                  // make sure there is a boat
                  if(boatDetails.containsValue(null)){
                    Navigator.pushNamed(context, '/create_boat');
                  }else {

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>
                            Confirmation(
                              serviceName: 'Dock Side',
                              services: services,
                              date: selectedDate.copyWith(
                                  hour: selectedTime.hour,
                                  minute: selectedTime.minute),
                              cost: cost,
                              additionalInstructions: additionalInstructions,
                              boatDetails: boatDetails,
                            )));
                  }
                }
            )
          ],
        ),

      ),
    );
  }
  getBoat() async {
    // boat length, boat name, location, user name
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      boatDetails['length'] = prefs.getDouble('nm_boat_length');
      boatDetails['boat_name'] = prefs.getString('nm_boat_name');
      boatDetails['boat_location'] = prefs.getString('nm_boat_location');

      boatDetails['user_name'] = prefs.getString('nm_user_name');
      boatDetails['user_phone'] = prefs.getString('nm_user_phone');
      boatDetails['user_email'] = prefs.getString('nm_user_email');
    });
  }
}
