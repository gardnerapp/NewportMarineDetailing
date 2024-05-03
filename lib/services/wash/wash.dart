

import 'package:flutter/material.dart';
import 'package:newport_marine/components/form_submit_btn.dart';

import 'package:newport_marine/services/appointments/book_appointment.dart';
import 'package:newport_marine/services/services_reciept.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../styles.dart';
import 'switch_tile.dart';

// OnSubmit to map to wash confirmation page
// todo dynamic cost
// what do boat attributes look like when There is not boat

class WashPage extends StatefulWidget {
  const WashPage({super.key});

  @override
  State<WashPage> createState() => _WashPageState();
}

class _WashPageState extends State<WashPage> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = const TimeOfDay(hour: 07, minute: 00);
  double cost = 0.0; // cost per foot * boat length what does late do
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
          const InstructionText(instruction: "Select your options:\n"),
          SwitchTile(
              option: "Stainless Steel",
              optionCost: 5.0,
              handleChange: (bool value) async {
                //get length push to create boat if doesn't exit
                var length = await getLength();
                checkLength(length);

                setState((){

                  var num = length * 5.0;

                  // calculate price based on boat length
                  // double num widget.user.boat.length * 5.0
                  // if no user on select -> redirect to create profile
                  if (value) {

                    cost += num;
                    services["Stainless Steel"] = num;
                  } else { // if they go from yes to no this will run
                    cost -= num;
                    services.remove("Stainless Steel");
                  }}
              );
              }
          ),
          const SizedBox(height: 10.0),
          SwitchTile(
              option: "Glass Polishing",
              optionCost: 3.0,
              handleChange: (bool value) async {
                //get length push to create boat if doesn't exit
                var length = await getLength();
                checkLength(length);
                setState(() {
                  double num = 3.0 * length;
                  // calculate price based on boat length
                  // double num widget.user.boat.length * 5.0
                  // if no user on select -> redirect to create profile
                  if (value) {
                    cost += num;
                    services["Glass Polishing"] = num;
                  } else { // if they go from yes to no this will run
                    cost = cost - num;
                    services.remove("Glass Polishing");
                  }
                }
                );
              }
          ),
          const SizedBox(height: 10.0),
          SwitchTile(
              option: "Cabin Maid",
              optionCost: 16.0,
              handleChange: (bool value) => setState((){
                double num = 16.0;
               // no cost based on boat len for this one

                // if no user on select -> redirect to create profile
                if (value) {
                  cost += num;
                  services["Cabin Maid"] = num;
                } else { // if they go from yes to no this will run
                  cost = cost - num;
                  services.remove("Cabin Maid");
                }}
              )
          ),
          const SizedBox(height: 10),
          SwitchTile(
              option: "Free Compartment Cleaning !",
              optionCost: 0.0,
              handleChange: (bool value) => setState((){
                if (value) {
                  services["Compartment Cleaning"] = 0.0;
                } else { // if they go from yes to no this will run
                  services.remove("Compartment Cleaning");
                }}
              )
          ),
          const SizedBox(height: 30.0),
          ServicesReceipt(
              date: selectedDate,
              time: selectedTime,
              cost: cost
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
          const SizedBox(height: 25.0),
          FormSubmitBtn(
              label: "Book Wash",
              icon: const Icon(
                Icons.directions_boat,
                size: 40.0,
                color: Colors.lightBlueAccent),
              onPressed: () async {

              } )
        ],
      ),
    );
  }

   getLength() async {
    final prefs = await SharedPreferences.getInstance();

    double? length = prefs.getDouble('nm_boat_length');

    length = prefs.getDouble('nm_boat_length');
    return length;
  }

  checkLength(dynamic length){
    print(length);
    if(length == null){
      Navigator.pushNamed(context, '/create_boat');
    }
  }
}
