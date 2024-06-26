import 'package:flutter/material.dart';
import 'package:newport_marine/components/customAppBar.dart';
import 'package:newport_marine/components/form_submit_btn.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("My Boat", context),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25.0),
        child: Form(
            key: _formKey,
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
                FormSubmitBtn(
                  label: "Get Started !",
                  icon: const Icon(
                    Icons.directions_boat,
                    size: 40.0,
                    color: Colors.lightBlueAccent,),
                    onPressed: () async {
                      if(_formKey.currentState!.validate()){
                        // Store data on disc
                        final prefs = await SharedPreferences.getInstance();

                        // save boat
                        await prefs.setString('nm_boat_name', boatName);
                        await prefs.setString('nm_boat_location', location);
                        await prefs.setDouble('nm_boat_length', length);

                        // save user data
                        await prefs.setString('nm_user_name', userName);
                        await prefs.setString('nm_user_phone', phone);
                        await prefs.setString('nm_user_email', email);

                        // Push to the homepage and notify user
                        Navigator.pushNamed(context, '/');
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              backgroundColor: Colors.white,
                              elevation: 20.0,
                              padding: EdgeInsets.all(20.0),
                              content: Text(
                                'Congrats, you can get started ! ',
                                style: TextStyle(
                                    fontSize: 30.0,
                                    color: Colors.black87)
                              )
                          ),
                        );
                      }else{

                      }
                    },
                ),
              ]
            )),
      ),

    );
  }
}
