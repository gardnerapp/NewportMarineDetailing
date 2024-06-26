import 'package:flutter/material.dart';

class ServiceTile extends StatelessWidget{
  final String asset;
  final String title;
  final String subTitle;
  final IconData icon;
  final Function() onTap;

  const ServiceTile({
    super.key,
    required this.asset,
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(8.0),
      child: Card( color: Colors.white,
        child: InkWell(
          splashColor: Colors.greenAccent,
          onTap: onTap,
          child: SizedBox(
            height: 350,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 200,
                  width: 300,
                  child: Image(
                    fit: BoxFit.fill,
                    image: AssetImage(asset),
                  ),
                ),
                ListTile(
                  leading: Icon(icon, size: 30.0, color: Colors.blueGrey[600]),
                  title: Text(title,
                      style: const TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                      textAlign: TextAlign.left,),
                  subtitle: Text(subTitle,
                      style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                      textAlign: TextAlign.left),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}