import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newport_marine/services/styles.dart';

class ServicesReceipt extends StatelessWidget {
  final DateTime date;
  final double cost;

  const ServicesReceipt({
    super.key,
    required this.date,
    required this.cost});

  @override
  Widget build(BuildContext context) {
    var appointment = DateFormat('MM-dd-yyyy @ kk:mm a').format(date);
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const InstructionText(
                instruction: "My appointment:"
            ),
            InstructionText(
                instruction: appointment
                //"${date.month}/${date.day} @ ${date.hour}:${date.minute}"
            ),
            InstructionText(
                instruction: "Total: \$$cost"
            ),
          ],
        ),

      );
  }
}
