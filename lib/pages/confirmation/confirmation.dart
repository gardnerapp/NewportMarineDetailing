import 'package:flutter/material.dart';
import 'package:newport_marine/components/customAppBar.dart';
import 'package:newport_marine/pages/confirmation/confirmation_card.dart';

class Confirmation extends StatelessWidget {
  final String serviceName;
  final DateTime date;
  final TimeOfDay time;
  final double cost;
  final String additionalInstructions;
  final Map<String,dynamic> services;

  const Confirmation({
    super.key,
    required this.serviceName,
    required this.date,
    required this.time,
    required this.cost,
    required this.additionalInstructions,
    required this.services
  });

  @override
  Widget build(BuildContext context) {

    var appointmentTime = "${date.month}/${date.day} @ ${time.toString()}";

    return Scaffold(
      appBar: customAppBar("Thank You !", context),
      body: const ConfirmationCard(children: [],),
    );
  }
}
