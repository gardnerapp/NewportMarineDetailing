import 'package:flutter/material.dart';
import 'package:newport_marine/services/styles.dart';

class ServicesReceipt extends StatelessWidget {
  final DateTime date;
  final TimeOfDay time;
  final double cost;

  const ServicesReceipt({
    super.key,
    required this.date,
    required this.time,
    required this.cost});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const InstructionText(
                instruction: "My appointment:\n"
            ),
            InstructionText(
                instruction: "${date.month}/${date.day} @ ${time.hour}:${time.minute}\n"
            ),
            InstructionText(
                instruction: "Total: \$$cost"
            ),
          ],
        ),

      ),
    );
  }
}
