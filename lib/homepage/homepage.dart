import 'package:image_card/image_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final user = FirebaseAuth.instance.currentUser;

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
                          Navigator.pushNamed(context, "additem");
                        },
                        icon: const Icon(Icons.add_box)),
                  ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FillImageCard(
                  color: Colors.white,

                  width: 120,
                  heightImage: 150,
                  imageProvider: const AssetImage('assets/cakeimage.jpg'),
                  //tags: [_tag('Category', () {}), _tag('Product', () {})],
                  title: TextButton(
                    style: const ButtonStyle(
                        tapTargetSize: MaterialTapTargetSize.padded),
                    onPressed: () {
                      //navigate to the cake section where seller is posted.
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'CAKES',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  //description: _content(),
                ),
                FillImageCard(
                    width: 120,
                    heightImage: 150,
                    imageProvider: const AssetImage('assets/puddinimage.jpg'),
                    //tags: [_tag('Category', () {}), _tag('Product', () {})],
                    title: TextButton(
                      style: const ButtonStyle(
                          tapTargetSize: MaterialTapTargetSize.padded),
                      onPressed: () {
                        //navigate to the cake section where seller is posted.
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'PUDDINGS',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    )),
                FillImageCard(
                  width: 120,
                  heightImage: 150,
                  imageProvider: const AssetImage('assets/snacksimage.jpg'),
                  //tags: [_tag('Category', () {}), _tag('Product', () {})],
                  title: TextButton(
                    style: const ButtonStyle(
                        tapTargetSize: MaterialTapTargetSize.padded),
                    onPressed: () {
                      //navigate to the cake section where seller is posted.
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'SNACKS',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FillImageCard(
                  color: Colors.white,

                  width: 120,
                  heightImage: 150,
                  imageProvider: const AssetImage('assets/icecreamimage.jpg'),
                  //tags: [_tag('Category', () {}), _tag('Product', () {})],
                  title: TextButton(
                    style: const ButtonStyle(
                        tapTargetSize: MaterialTapTargetSize.padded),
                    onPressed: () {
                      //navigate to the cake section where seller is posted.
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'ICE CREAMS',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                FillImageCard(
                  width: 120,
                  heightImage: 150,
                  imageProvider: const AssetImage('assets/sweetsimage.jpg'),
                  //tags: [_tag('Category', () {}), _tag('Product', () {})],
                  title: TextButton(
                    style: const ButtonStyle(
                        tapTargetSize: MaterialTapTargetSize.padded),
                    onPressed: () {
                      //navigate to the cake section where seller is posted.
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'SWEETS',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                FillImageCard(
                  width: 120,
                  heightImage: 150,
                  imageProvider: const AssetImage('assets/pizzaimage.jpg'),
                  //tags: [_tag('Category', () {}), _tag('Product', () {})],
                  title: TextButton(
                    style: const ButtonStyle(
                        tapTargetSize: MaterialTapTargetSize.padded),
                    onPressed: () {
                      //navigate to the cake section where seller is posted.
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'PIZZA',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
