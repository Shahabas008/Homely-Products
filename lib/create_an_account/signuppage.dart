

import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body1(context),
    );
  }

  Widget body1(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            height: 200,
            width: double.infinity,
            color: const Color(0xff7f4ca5),
            child: Image.asset(
              'assets/homebakery-bgremoved.png',
              width: 50,
              height: 50,
            ),
          ),
          Container(
           
            width: double.infinity,
            height: 200,
            color: const Color(0xffffafcc),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Choose Your Type',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )
              ],
            ),
            
            
          ),
          // ignore: sized_box_for_whitespace
          Container(
            alignment: Alignment.topCenter,
            width: double.infinity,
            height: 293,
            color: const Color(0xffffafcc),
            child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  
                  style: ElevatedButton.styleFrom(
                    
                    minimumSize:const Size(130, 100)
                  ),
                  onPressed: () {
                      Navigator.pushReplacementNamed(context, "signupforseller");
                  },
                  child: const Text("SELLER"),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize:const Size(100, 100)
                  ),
                  onPressed: () {
                    
                  Navigator.pushReplacementNamed(context, "signupforcustomer");
                  },
                  child: const Text("CUSTOMER"),
                ),
              ],
            ),

          )
        ],
      ),
    );
  }
}
