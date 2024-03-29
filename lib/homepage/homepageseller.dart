import 'package:get/get.dart';
import 'package:image_card/image_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nihaljumailamrathaju/homepage/search.dart';

class Homepageseller extends StatefulWidget {
  const Homepageseller({super.key});

  @override
  State<Homepageseller> createState() => _HomepagesellerState();
}

class _HomepagesellerState extends State<Homepageseller> {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffffafcc),
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: AppBar(
              backgroundColor: const Color(0xff7f4ca5),
              leading: IconButton(
                  color: Colors.white,
                  onPressed: () {
                    //navigating to the notification page
                  },
                  icon: const Icon(Icons.notifications)),
              title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(width: 40,),
                    Image.asset(
                      'assets/homebakery-bgremoved.png',
                      width: 100,
                      height: 100,
                    ),
                  ]),
              actions: [
                IconButton(onPressed: () {
                  Get.to(() => const Filterpage());
                }, icon: const Icon(Icons.filter_alt)),
                IconButton(
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pushNamed(context, "additem");
                    },
                    icon: const Icon(Icons.add_box)),
                    
              ],
            )),
        body: SingleChildScrollView(
          child: Column(
            children: [
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
                          Navigator.pushNamed(context, "Cakelistview");
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'CAKES',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
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
                            Navigator.pushNamed(context, "Puddinglistview");
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
                          Navigator.pushNamed(context, "Snacklistview");
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'SNACKS',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
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
                          Navigator.pushNamed(context, "Icecreamlistview");
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'ICE CREAMS',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
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
                          Navigator.pushNamed(context, "Sweetslistview");
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'SWEETS',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
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
                          Navigator.pushNamed(context, "Pizzalistview");
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'PIZZA',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
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
        ),
      ),
    );
  }
}
