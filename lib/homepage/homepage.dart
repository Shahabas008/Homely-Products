import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

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
                          //navigating to the notification page
                        },
                        icon: const Icon(Icons.add_box)),
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
