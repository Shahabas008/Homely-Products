import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nihaljumailamrathaju/homepage/cartcustomer.dart';
import 'package:nihaljumailamrathaju/homepage/cartpage.dart';
import 'package:nihaljumailamrathaju/homepage/favoritescustomer.dart';
import 'package:nihaljumailamrathaju/homepage/favourites.dart';
import 'package:nihaljumailamrathaju/homepage/homepagecustomer.dart';
import 'package:nihaljumailamrathaju/homepage/homepageseller.dart';
import 'package:nihaljumailamrathaju/homepage/profilepagecustomer.dart';
import 'package:nihaljumailamrathaju/homepage/profilepageseller.dart';

class Homepagelayout extends StatefulWidget {
  const Homepagelayout({super.key});

  @override
  State<Homepagelayout> createState() => _HomepagelayoutState();
}

class _HomepagelayoutState extends State<Homepagelayout> {
  bool isCustomer = false;

  void decider() async {
    DocumentSnapshot currentUser = await FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .get();

    if (currentUser.get("categorys") == "customer") {
      setState(() {
        isCustomer = true;
      });

      return;
    }
    setState(() {
      isCustomer = false;
    });
  }

  @override
  void initState() {
    super.initState();
    decider();
  }

  int pageIndex = 0;

  final sellerPages = [
    const Homepageseller(),
    const Favoritepage(),
    const Cartpage(),
    const Profilepageseller(),
  ];
  final customerPages = [
    const HomepageCustomer(),
    const Favoritecustomerpage(),
    const Cartcustomerpage(),
    const Profilepagecustomer(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: isCustomer ? customerPages[pageIndex] : sellerPages[pageIndex],
        backgroundColor: const Color(0xffffafcc),
        bottomNavigationBar: Container(
          height: 60,
          decoration: const BoxDecoration(
            color: Color(0xff7f4ca5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 0;
                  });
                },
                icon: pageIndex == 0
                    ? const Icon(
                        Icons.home_filled,
                        color: Colors.white,
                        size: 35,
                      )
                    : const Icon(
                        Icons.home_outlined,
                        color: Colors.white,
                        size: 35,
                      ),
              ),
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 1;
                  });
                },
                icon: pageIndex == 1
                    ? const Icon(
                        Icons.favorite,
                        color: Colors.white,
                        size: 35,
                      )
                    : const Icon(
                        Icons.favorite_outline_outlined,
                        color: Colors.white,
                        size: 35,
                      ),
              ),
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 2;
                  });
                },
                icon: pageIndex == 2
                    ? const Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                        size: 35,
                      )
                    : const Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.white,
                        size: 35,
                      ),
              ),
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 3;
                  });
                },
                icon: pageIndex == 3
                    ? const Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 35,
                      )
                    : const Icon(
                        Icons.person_outline,
                        color: Colors.white,
                        size: 35,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
