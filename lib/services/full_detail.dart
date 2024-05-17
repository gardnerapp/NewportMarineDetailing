import 'package:flutter/material.dart';
import 'package:newport_marine/services/styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/form_submit_btn.dart';
import '../pages/confirmation/confirmation.dart';
import 'appointments/book_appointment.dart';

class FullDetail extends StatefulWidget {
  const FullDetail({super.key});

  @override
  State<FullDetail> createState() => _FullDetailState();
}

class _FullDetailState extends State<FullDetail> {
  double cost = 0.0;
  var selectedDate = DateTime.now();
  var selectedTime = TimeOfDay.now();
  String additionalInstructions = '';
  Map<String,double> services = {};
  Map<String,dynamic> boatDetails = {};

  @override
  Widget build(BuildContext context) {

    getBoat();

    return Scaffold(
      appBar: AppBar(title: const Text("Full Detail")),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          const InstructionText(instruction: "Compound Wax & Polish\n"),
          const InstructionText(instruction: "One Season of Protection\n"),
          const InstructionText(instruction: "Stainless Steel Polishing\n"),
          const InstructionText(instruction: "Eigen Glass Cleaning\n"),
          const InstructionText(instruction: "Oxidation Removal\n"),
          const Divider(height: 25.0, thickness: 2.5, color: Colors.blue),
          const SizedBox(height: 15.0),
          const InstructionText(instruction: "Compound Polish/Wax Topside:\n"),
          const InstructionText(instruction: "\n"),
          const InstructionText(instruction: "\$37.00 / ft\n"),
          const SizedBox(height: 15.0),
          BookAppointment(
            handleDateChange: (DateTime date) => setState(() => selectedDate = date),
            handleTImeChange: (TimeOfDay time) => setState(() => selectedTime = time),
          ),
          const SizedBox(height: 25.0),
          const Divider(height: 25.0, thickness: 2.5, color: Colors.blue),
          const SizedBox(height: 25.0),
          const InstructionText(instruction: "Please specify any unlisted services below\n"),
          const InstructionText(instruction: "Pricing will vary\n"),
          const SizedBox(height: 25.0),
          TextFormField(
            decoration: textInputDecoration("Anything Else ?"),
            onChanged: (val){
              setState(() {
                additionalInstructions = val;
              });
            },
          ),
          const SizedBox(height: 25.0),
          FormSubmitBtn(
              label: "Book Full Detail",
              icon: const Icon(
                  Icons.directions_boat,
                  size: 40.0,
                  color: Colors.lightBlueAccent),
              onPressed: () {
                // make sure there is a boat
                if(boatDetails.containsValue(null)){
                  Navigator.pushNamed(context, '/create_boat');
                }else {
                  setState(() {
                    cost = boatDetails['length'] * 37.0;
                  });
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>
                            Confirmation(
                              serviceName: 'Full Detail',
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
