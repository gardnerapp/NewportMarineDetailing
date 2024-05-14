import 'package:flutter/material.dart';
import 'package:newport_marine/components/customAppBar.dart';
import 'package:newport_marine/pages/confirmation/confirmation_card.dart';

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
    var appointmentTime = "${date.month}/${date.day} @";

    return Scaffold(
      appBar: customAppBar("Thank You !", context),
      body: ConfirmationCard(
          children: [
            const SizedBox(height: 20),
            Text(
              "Thank you ${boatDetails['user_name']} choosing Newport Marine Detailing ! ",
              style: washCardStyle(),
              textAlign: TextAlign.center
            ),
            const SizedBox(height: 20),
            Text(
                "A $serviceName has been booked for $appointmentTime ",
                style: washCardStyle(),
                textAlign: TextAlign.center
            ),


      ]),
    );
  }
}