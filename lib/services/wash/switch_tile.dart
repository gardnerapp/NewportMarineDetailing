import 'package:flutter/material.dart';
import 'wash_styles.dart';

class WashSwitchTile extends StatefulWidget {

  final String option;
  final double optionCost;
  final Function handleChange;

  const WashSwitchTile({
    super.key,
    required this.option,
    required this.optionCost,
    required this.handleChange
  });

  @override
  State<WashSwitchTile> createState() => _WashSwitchTileState();
}

class _WashSwitchTileState extends State<WashSwitchTile> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card( // todo gloablly style cards
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

      )
    )
  }
}
