import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nihaljumailamrathaju/additem/additem.dart';
import 'package:nihaljumailamrathaju/controllers/order.dart';
import 'package:nihaljumailamrathaju/homepage/search.dart';

class Cartpage extends StatefulWidget {
  const Cartpage({super.key});

  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  final data1 = Get.put(Orderpage());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    const SizedBox(
                      width: 40,
                    ),
                    Image.asset(
                      'assets/homebakery-bgremoved.png',
                      width: 100,
                      height: 100,
                    ),
                  ]),
              actions: [
                IconButton(
                    onPressed: () {
                      Get.to(() => const Filterpage());
                    },
                    icon: const Icon(Icons.filter_alt)),
                IconButton(
                    color: Colors.white,
                    onPressed: () {
                      Get.to(() => const Additempage());
                    },
                    icon: const Icon(Icons.add_box)),
              ],
            )),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('User-Cart-Item')
                .doc(FirebaseAuth.instance.currentUser!.email)
                .collection("items")
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Text(
                      'YOUR CART IS EMPTY!',
                      style: TextStyle(
                        color: Color(0xff7f4ca5),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  );
                } else {
                  return Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data == null
                                ? 0
                                : snapshot.data!.docs.length,
                            itemBuilder: (_, index) {
                              DocumentSnapshot documentSnapshot =
                                  snapshot.data!.docs[index];

                              return Card(
                                color: const Color.fromARGB(255, 255, 248, 250),
                                margin: const EdgeInsets.all(20),
                                child: Container(
                                  height: 140,
                                  padding: const EdgeInsets.all(0),
                                  child: Row(children: [
                                    Expanded(
                                      flex: 6,
                                      child: Container(
                                        child: documentSnapshot["images"] == ""
                                        ?Image.asset("assets/noimage.png")
                                        :Image.network(documentSnapshot["images"],
                                        fit: BoxFit.fill,),
                                      ),
                                    ),
                                    const Spacer(
                                      flex: 1,
                                    ),
                                    Expanded(
                                      flex: 14,
                                      child: Container(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Text(documentSnapshot['name'],
                                                style: const TextStyle(
                                                    fontSize: 20.0,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            // ignore: prefer_interpolation_to_compose_strings
                                            Text(
                                                // ignore: prefer_interpolation_to_compose_strings
                                                'Net Weight:   ' +
                                                    documentSnapshot[
                                                        'netweight'],
                                                style: const TextStyle(
                                                  fontSize: 20.0,
                                                )),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 0, 10, 0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Text(
                                                    documentSnapshot['price'],
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 20),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      FirebaseFirestore.instance
                                                          .collection(
                                                              'User-Cart-Item')
                                                          .doc(FirebaseAuth
                                                              .instance
                                                              .currentUser!
                                                              .email)
                                                          .collection("items")
                                                          .doc(documentSnapshot
                                                              .id)
                                                          .delete();
                                                    },
                                                    child: const CircleAvatar(
                                                      backgroundColor:
                                                          Color.fromARGB(
                                                              255, 0, 0, 0),
                                                      child: Icon(
                                                        Icons
                                                            .remove_shopping_cart_outlined,
                                                        color: Color.fromARGB(
                                                            255, 255, 255, 255),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Row(
                                              children: <Widget>[
                                                TextButton(
                                                  onPressed: () {
                                                    data1.order(context);
                                                  },
                                                  child: const Text(
                                                    'Order',
                                                    style: TextStyle(
                                                        color: Colors.purple),
                                                  ),
                                                ),
                                                // Text(
                                                //   "barcode",
                                                //   style: TextStyle(fontSize: 15.0),
                                                // ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ]),
                                ),
                              );
                            }),
                        SizedBox(
                            child: Center(
                          child: Container(
                            color: const Color(0xffffafcc),
                            child: Text(
'Total Price: \$${snapshot.data!.docs.isNotEmpty ? snapshot.data!.docs.map<int>((documentSnapshot) {
  final price = int.tryParse(documentSnapshot['price'].trim()) ?? 0;
  print('Price: $price');
  return price;
}).reduce((sum, price) => sum + price) : 0}',
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ))
                      ],
                    ),
                  );
                }
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }));
  }
}
