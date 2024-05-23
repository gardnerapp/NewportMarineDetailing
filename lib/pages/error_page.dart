import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Error !!"),
          elevation: 16.0,
          leading: IconButton(icon: const Icon(Icons.home), onPressed: (){
            Navigator.pushNamed(context, '/');
          }),
        ),
        body:
        Container(
          padding: const EdgeInsets.all(20.0),
          child: const Center(
              child: Text("\tIf this continues to be an issue please contact our customer service\n\n https://newportmarine.app/help ",
                style: TextStyle(fontSize: 30.0), textAlign: TextAlign.center,)
          )));
  }
}
