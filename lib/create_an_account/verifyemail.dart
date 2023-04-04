import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nihaljumailamrathaju/homepage/appbar_bottomnav.dart';

class Verifyemailpage extends StatefulWidget {
  const Verifyemailpage({super.key});

  @override
  State<Verifyemailpage> createState() => VerifyemailpageState();
}

class VerifyemailpageState extends State<Verifyemailpage> {
  final email = Get.arguments['email'];
    final auth = FirebaseAuth.instance;
    User? user;
    Timer? timer;
    Future<void> checkEmailVerified() async {
      user = auth.currentUser;
      await user!.reload();
      if (user!.emailVerified) {
        timer!.cancel();
        Get.to(() => const Homepagelayout());
      }
    }

    @override
    void initState() {
      user = auth.currentUser;
      user!.sendEmailVerification();
      timer = Timer.periodic(const Duration(seconds: 5), (timer) {
        checkEmailVerified();
      });
      super.initState();
    }

    @override
    void dispose() {
      timer!.cancel();
      super.dispose();
    }
  @override
  Widget build(BuildContext context) {
    
    return  SafeArea(
      child:  Scaffold(
       backgroundColor: const Color.fromARGB(255, 216, 211, 211),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(8, 300, 8, 50),
          child: Center(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
              
              // ignore: prefer_const_literals_to_create_immutables
              children : [
                 SizedBox(
                  child:Text('                Verification Mail \n               has been sent to  \n     $email !',
              style:const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 0, 0, 0),
              ),),
              
                ),
               const  SizedBox(
                  height: 120,
                ),
                const SizedBox(
                  child: Text('Check the entered E-Mail if the Mail hasn\'t received',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),),
                )
              
                 
              ] 
              
            ),
          ),
          
        ),
        
      ),
    );
  }
}
