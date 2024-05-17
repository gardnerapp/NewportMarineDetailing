import 'package:flutter/material.dart';
import 'package:newport_marine/components/customAppBar.dart';
import 'package:newport_marine/pages/confirmation/confirmation_card.dart';
import 'package:newport_marine/services/helpers.dart';

import '../../services/styles.dart';

class Confirmation extends StatelessWidget {
  final String serviceName;
  final DateTime date;
  final double cost;
  final String additionalInstructions;
  final Map<String,dynamic> services;
  final Map<String, dynamic> boatDetails;

  const Confirmation({
    super.key,
    required this.serviceName,
    required this.date,
    required this.cost,
    required this.additionalInstructions,
    required this.services,
    required this.boatDetails,
  });

  @override
  Widget build(BuildContext context) {
    var appointmentTime = formatDate(date);

    return Scaffold(
      appBar: customAppBar("Thank You !", context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20,),
          const Image(image: AssetImage("lib/assets/img/full_logo.png")),
          ConfirmationCard(
              children: [
                const SizedBox(height: 20),
                Text(
                  "Thank you ${boatDetails['user_name']} choosing Newport Marine Detailing !\n ",
                  style: washCardStyle(),
                  textAlign: TextAlign.left
                ),
             //   const SizedBox(height: 20),
                Text(
                    "A $serviceName has been booked for ${boatDetails['boat_name']} "
                        "at ${boatDetails['boat_location']} for $appointmentTime\n ",
                    style: washCardStyle(),
                    textAlign: TextAlign.left
                ),
                Text(
                    "Total \$ $cost\n",
                    style: washCardStyle(),
                    textAlign: TextAlign.left
                ),
          ]
          ),
        ],
      ),
    );
  }
}
