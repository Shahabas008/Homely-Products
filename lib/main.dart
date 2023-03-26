import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nihaljumailamrathaju/additem/additem.dart';
import 'package:nihaljumailamrathaju/additem/cakelistview.dart';
import 'package:nihaljumailamrathaju/additem/icecreamitemview.dart';
import 'package:nihaljumailamrathaju/additem/pizzalistview.dart';
import 'package:nihaljumailamrathaju/additem/puddinglistview.dart';
import 'package:nihaljumailamrathaju/additem/snakslistview.dart';
import 'package:nihaljumailamrathaju/additem/sweetslistview.dart';
import 'package:nihaljumailamrathaju/create_an_account/loginpage.dart';
import 'package:nihaljumailamrathaju/create_an_account/signuppage.dart';
import 'package:nihaljumailamrathaju/homepage/appbar_bottomnav.dart';
import 'package:nihaljumailamrathaju/homepage/homepagecustomer.dart';
import 'package:nihaljumailamrathaju/homepage/homepageseller.dart';
import 'package:get/get.dart';
import 'package:nihaljumailamrathaju/homepage/search.dart';
import 'package:nihaljumailamrathaju/splashscreen/splashscreen2.dart';
import 'resources/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          inputDecorationTheme: const InputDecorationTheme(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffffafcc), width: 2)))),
      initialRoute: 'splashscreen',
      routes: {
        'splashscreen': (context) =>  const Loginpage(),
        "splashscreen2": (context) => const Splashscreen2(),
        'loginpage': (context) => const Loginpage(),
        'signuppage': (context) => const Signup(),
        'homelayout': (context) => const Homepagelayout(),
        'additem': (context) => const Additempage(),
        "Cakelistview": (context) => const Cakelistview(),
        "Puddinglistview": (context) => const Puddinglistview(),
        "Sweetslistview": (context) => const Sweetslistview(),
        "Icecreamlistview": (context) => const Icecreamlistview(),
        "Pizzalistview": (context) => const Pizzalistview(),
        "Snacklistview": (context) => const Snacklistview(),
        "homepageseller": (context) => const Homepageseller(),
        "homepagecustomer": (context) => const HomepageCustomer()
      },
    );
  }
}
