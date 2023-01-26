import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nihaljumailamrathaju/create_an_account/loginpage.dart';

class Profilepagecustomer extends StatefulWidget {
  const Profilepagecustomer({super.key});

  @override
  State<Profilepagecustomer> createState() => PprofilepagecustomerState();
}

class PprofilepagecustomerState extends State<Profilepagecustomer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffffafcc),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            centerTitle: true,
            title: Image.asset(
              'assets/homebakery-bgremoved.png',
              width: 100,
              height: 100,
            ),
            backgroundColor: const Color(0xff7f4ca5),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    _signOut();
                    FirebaseAuth.instance.signOut();
                   Get.to(() => const Loginpage());
                  },
                  child: const Text('Log out'))
            ],
          ),
        ),
      ),
    );
  }

  _signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
