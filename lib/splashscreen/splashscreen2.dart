import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nihaljumailamrathaju/create_an_account/loginpage.dart';
import 'package:nihaljumailamrathaju/homepage/appbar_bottomnav.dart';

class Splashscreen2 extends StatelessWidget {
  const Splashscreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: StreamBuilder<User?>(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return const Homepagelayout();
                  } else {
                    return GestureDetector(
                        child: Container(
                            decoration: const BoxDecoration(
                          color: Colors.black,
                          image: DecorationImage(
                              image: AssetImage("assets/splashscreen2.jpg"),
                              fit: BoxFit.fill),
                        )),
                        onTap: () {
                          Get.off(() => const Loginpage());
                        });
                  }
                })));
  }
}
