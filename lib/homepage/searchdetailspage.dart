import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nihaljumailamrathaju/controllers/order.dart';

class Searchdetailspage extends StatefulWidget {
  const Searchdetailspage({super.key});

  @override
  State<Searchdetailspage> createState() => _SearchdetailspageState();
}

class _SearchdetailspageState extends State<Searchdetailspage> {
  final data = Get.arguments;
  void addtoCart() async {
    Get.showSnackbar(
      const GetSnackBar(
        duration: Duration(seconds: 3),
        padding: EdgeInsets.all(25),
        backgroundColor: Color(0xff7f4ca5),
        messageText: Text(
          "The product is added to cart",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
    final FirebaseAuth auth = FirebaseAuth.instance;
    final currentuser = auth.currentUser;
    CollectionReference collectionRef =
        FirebaseFirestore.instance.collection('User-Cart-Item');

    return collectionRef.doc(currentuser!.email).collection("items").doc().set({
      "name": data[2],
      "price": data[0],
      "images": data[3],
      "netweight": data[1]
    }).then((value) => debugPrint("Added to Cart"));
  }

  Future addToFavourite() async {
    Get.showSnackbar(
      const GetSnackBar(
        duration: Duration(seconds: 3),
        padding: EdgeInsets.all(25),
        backgroundColor: Color(0xff7f4ca5),
        messageText: Text(
          "The product is added to Favourites",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
    final FirebaseAuth auth = FirebaseAuth.instance;
    User? currentUser = auth.currentUser;
    CollectionReference collectionRef =
        FirebaseFirestore.instance.collection("users-favourite-items");
    return collectionRef.doc(currentUser!.email).collection("items").doc().set({
      "name": data[2],
      "price": data[0],
      "images": data[3],
      "netweight": data[1]
    }).then((value) => print("Added to favourite"));
  }

  Future removeFromFavourite({required String docId}) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    User? currentUser = auth.currentUser;
    CollectionReference collectionRef =
        FirebaseFirestore.instance.collection("users-favourite-items");
    return collectionRef
        .doc(currentUser!.email)
        .collection("items")
        .doc(docId)
        .delete()
        .then((value) => print("Favourites deleted"));
  }

  @override
  Widget build(BuildContext context) {
    bool isUserLoggedIn = FirebaseAuth.instance.currentUser != null;
    final data1 = Get.put(Orderpage());

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff7f4ca5),
        actions: [
          isUserLoggedIn
              ? StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("users-favourite-items")
                      .doc(FirebaseAuth.instance.currentUser!.email)
                      .collection("items")
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.data == null) {
                      return Container();
                    }
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: CircleAvatar(
                        backgroundColor: Colors.red,
                        child: IconButton(
                          onPressed: () => snapshot.data!.docs.isEmpty
                              ? addToFavourite()
                              : removeFromFavourite(
                                  docId: snapshot.data!.docs[0].id),
                          icon: snapshot.data!.docs.isEmpty
                              ? const Icon(
                                  Icons.favorite_outline,
                                  color: Colors.white,
                                )
                              : const Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                ),
                        ),
                      ),
                    );
                  },
                )
              : Container(
                  padding: const EdgeInsets.fromLTRB(200, 200, 200, 200),
                ),
        ],
      ),
      backgroundColor: Colors.pink[200],
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  child: data[3] == ""
                      ? Image.asset("assets/noimage.png")
                      : Image.network(
                          data[3],
                          width: 200,
                          height: 200,
                        )),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                data[2],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                data[4],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'PRICE :',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                data[0],
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                'NET WEIGHT (in KG.) :',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                data[1],
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              // const SizedBox(
              //   height: 25,
              // ),
              // const Text(
              //   'BAKER :',
              //   style:
              //       TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              // ),
              // Text(
              //   data['Baker Description'],
              //   style: const TextStyle(
              //       fontWeight: FontWeight.bold, fontSize: 15),
              // ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      addtoCart();
                    },
                    child: const Text('Add to Cart'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      data1.order(context);
                    },
                    child: const Text('Order'),
                  )
                ],
              )
            ],
          )
        ]),
      ),
    ));
  }
}
