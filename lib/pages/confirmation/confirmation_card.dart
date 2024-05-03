import 'package:flutter/material.dart';

class ConfirmationCard extends StatelessWidget {
  final List<Widget> children;

  const ConfirmationCard({
    super.key,
    required this.children});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Card(
          child: ListView(
            shrinkWrap: true,
            children: children,
          ),
        ),
      ),
    );
  }
}
