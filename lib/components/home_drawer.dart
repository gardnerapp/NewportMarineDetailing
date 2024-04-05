import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage("lib/assets/img/newport_marine_logo.jpg"),
          ),
          const SizedBox(height: 50.0),
          Text("Please Report Any Issues to\n",
              style: Theme.of(context).textTheme.bodyMedium),
          Text("https://newportmarine.app/help"
              , style: Theme.of(context).textTheme.bodyMedium)
        ],
      ),
    );
  }
}
