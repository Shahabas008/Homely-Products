import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nihaljumailamrathaju/homepage/additem.dart';
import 'package:nihaljumailamrathaju/create_an_account/loginpage.dart';

import 'package:nihaljumailamrathaju/create_an_account/signupforcustomer.dart';
import 'package:nihaljumailamrathaju/create_an_account/signupforseller.dart';
import 'package:nihaljumailamrathaju/create_an_account/signuppage.dart';
import 'package:nihaljumailamrathaju/homepage/appbar_bottomnav.dart';

import 'package:nihaljumailamrathaju/splashscreen/splashscreen.dart';
import 'package:nihaljumailamrathaju/splashscreen/splashscreen2.dart';

import 'resources/firebase_options.dart';
//import 'package:nihaljumailamrathaju/create_an_account/signupforcustomer.dart';
//import 'package:nihaljumailamrathaju/create_an_account/signupforseller.dart';
//import 'package:nihaljumailamrathaju/create_an_account/signuppage.dart';
//import 'package:nihaljumailamrathaju/homepage/appbar_bottomnav.dart';
//import 'package:nihaljumailamrathaju/splashscreen/splashscreen.dart';
//import 'package:nihaljumailamrathaju/splashscreen/splashscreen2.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.android,
  );
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          inputDecorationTheme: const InputDecorationTheme(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffffafcc), width: 2)))),
      initialRoute: 'splashscreen',
      routes: {
        'splashscreen': (context) => const Homepagelayout(),
        "splashscreen2": (context) => const Splashscreen2(),
        'loginpage': (context) => const Loginpage(),
        'signuppage': (context) => const Signup(),
        'signupforcustomer': (context) => const Signupforcustomer(),
        'signupforseller': (context) => const Signupforseller(),
        'homelayout': (context) => const Homepagelayout(),
        'additem': (context) => const Additempage(),
      },
    );
  }
}
