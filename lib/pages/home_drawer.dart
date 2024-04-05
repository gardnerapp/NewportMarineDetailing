import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: AssetImage("lib/assets/img/newport_marine_logo.jpg"),
          ),
          SizedBox(height: 50.0),
          Text("Please Report Any Issues to https://newportmarine.app/help")
        ],
      ),
    );
  }
}
