

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
final user = FirebaseAuth.instance.currentUser!;





  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            color: const Color(0xff7f4ca5),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        color: Colors.white,
                        onPressed: () {
                          //navigating to the notification page
                        },
                        icon: const Icon(Icons.notifications)),
                    Image.asset(
                      'assets/homebakery-bgremoved.png',
                      width: 150,
                      height: 500,
                    ),
                    IconButton(
                        color: Colors.white,
                        onPressed: () {
                         
                        },
                        icon: const Icon(Icons.add_box)),
                  ]),
                  
            ),
          ),
          Center(
             child: ElevatedButton(
              
              onPressed:(){
            FirebaseAuth.instance.signOut();
             }
             
             , child:const Text('sign out')),
          )
        ],
      ),
    );
  }





}
