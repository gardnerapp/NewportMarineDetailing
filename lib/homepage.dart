import 'package:flutter/material.dart';
import 'package:newport_marine/services/tile.dart';

class HomePage extends StatelessWidget{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: const Text("Newport Marine Detailing"),
       elevation: 16.0,
     ),
     body: ListView(
       padding: const EdgeInsets.all(30.0),
       shrinkWrap: true,
       children:  [
         const Image(image: AssetImage("lib/assets/img/full_logo.png")),
         // Wash
         Tile(asset: 'lib/assets/img/wash.jpg',
           title: "Daily & Weekly Washes",
           subTitle: "Discount Rates for Weekly & Biweekly plans",
           icon: Icons.update,
           onTap: (){
            print("Hi");
           },
         ),
         // Full Detail
         Tile(asset: 'lib/assets/img/full_detail.jpg',
           title: "Full Detailing",
           subTitle: "Everything You Need & More !",
           icon: Icons.wb_sunny,
           onTap: (){
             print("Hi");
           },
         ),
         Tile(asset: 'lib/assets/img/dock_side.jpeg',
           title: "Dock Side",
           subTitle: "Arrival/Departure Services & Supply Restock",
           icon: Icons.thumb_up,
           onTap: (){
             print("Hi");
           },
         ),
       ],
     ),
   );
  }

}