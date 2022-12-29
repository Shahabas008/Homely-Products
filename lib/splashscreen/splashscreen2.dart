import 'package:flutter/material.dart';

class Splashscreen2 extends StatelessWidget {
  const Splashscreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
          child: Container(
              decoration: const BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
                image: AssetImage("assets/splashscreen2.jpg"),
                fit: BoxFit.fill),
          )),
          onTap: () {
            Navigator.pushReplacementNamed(context, "loginpage");
          }),
    );
  }
}
