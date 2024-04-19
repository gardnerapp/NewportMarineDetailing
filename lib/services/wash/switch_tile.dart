import 'package:flutter/material.dart';

import '../styles.dart';

class SwitchTile extends StatefulWidget {

  final String option;
  final double optionCost;
  final Function handleChange;

  const SwitchTile({
    super.key,
    required this.option,
    required this.optionCost,
    required this.handleChange
  });

  @override
  State<SwitchTile> createState() => _SwitchTileState();
}

class _SwitchTileState extends State<SwitchTile> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return Card( // todo gloablly style cards
      child: SwitchListTile(
        title: Text(
          widget.option,
          style: washCardStyle(),
        ),
        subtitle: Text(
          "\$${widget.optionCost} per ft",
          style: washCardSubtitle(),
        ),
        value: _value,
        onChanged: (bool newValue) {
          setState(() {
            _value = newValue;
            widget.handleChange(_value);
          });
        },
      )

    );
  }
}
