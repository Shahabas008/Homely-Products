

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nihaljumailamrathaju/splashscreen/splashscreen2.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    waitingscreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        // ignore: avoid_unnecessary_containers
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 8,
                  color:const Color(0xff7f4ca5)
                )
              ),
              child: Image.asset('assets/homebakery.png',
              width: 230,
              height: 230,),
            ),
          ],
        ),
        
         
            ),
      );
    
  }

  void waitingscreen() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.off(() => const Splashscreen2());
    });
  }
}
