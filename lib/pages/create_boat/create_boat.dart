import 'package:flutter/material.dart';
import 'package:newport_marine/components/customAppBar.dart';

import 'boat_text_form.dart';

class CreateBoat extends StatefulWidget {
  const CreateBoat({super.key});

  @override
  State<CreateBoat> createState() => _CreateBoatState();
}

class _CreateBoatState extends State<CreateBoat> {
  // boat details
  late String boatName;
  late String location;
  late double length = 50;

  //user details
  late String userName;
  late String email;
  late String phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("My Boat", context),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25.0),
        child: Form(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              children:[
                BoatTextForm(
                  label: "My Name",
                  onChanged: (String val){
                    setState(() {
                      userName = val;
                    });
                }),
                BoatTextForm(
                    label: "Phone Number",
                    onChanged: (String val){
                      setState(() {
                        phone = val;
                      });
                    }),
                BoatTextForm(
                    label: "Email",
                    onChanged: (String val){
                      setState(() {
                        email = val;
                      });
                    }),
                BoatTextForm(
                    label: "Boat Name",
                    onChanged: (String val){
                      setState(() {
                        boatName = val;
                      });
                    }),
                Text("My Vessel is $length ft.",
                    textAlign: TextAlign.center,
                    style: formTitleStyle()),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.greenAccent,
                    inactiveTickMarkColor: Colors.blue,
                    trackHeight: 3.0,
                    thumbShape: const RoundSliderThumbShape(
                      enabledThumbRadius: 12.0
                    ),
                    overlayShape: const RoundSliderOverlayShape(
                      overlayRadius: 28.0
                    )
                  ),
                  child: Slider(
                    value: length,
                    onChanged: (double value) {
                    setState(() {
                      length = value;
                    });
                  },
                    min: 0,
                    max: 100,
                    divisions: 50,
                    label: "$length ft.",
                    activeColor: Colors.blue,
                  ),
                ),
                BoatTextForm(
                    label: "Boat Location",
                    onChanged: (String val){
                      setState(() {
                        location = val;
                      });
                    }),
              ]
            )),
      ),

    );
  }
}
