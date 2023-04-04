import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nihaljumailamrathaju/homepage/productpageforsellerdetailed.dart';


class Productspage extends StatefulWidget {
  const Productspage({super.key});

  @override
  State<Productspage> createState() => _ProductspageState();
}

class _ProductspageState extends State<Productspage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffffafcc),
        appBar: AppBar(
          title: const Text('Your Products'),
          backgroundColor:  const Color(0xff7f4ca5),
        ),
        body:StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
                .collection('User-Add Item')
                .doc(FirebaseAuth.instance.currentUser!.email)
                .collection('item')
                .snapshots(),
          
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
             if (snapshot.hasData) {
                if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Text(
                      'You Haven\'t Added Any Products',
                      style: TextStyle(
                        color:Color(0xff7f4ca5),
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  );
                } else {
                  return ListView.builder(
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
                                 child: documentSnapshot["URl"] == ""
                                 ?Image.asset("assets/noimage.png")
                                 :Image.network(documentSnapshot["URl"],
                                 fit: BoxFit.fill,)
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Text(documentSnapshot['Item Name'],
                                          style: const TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold)),
                                      // ignore: prefer_interpolation_to_compose_strings
                                      Text(
                                          // ignore: prefer_interpolation_to_compose_strings
                                          'Net Weight:   ' +
                                              documentSnapshot['Net Weight'],
                                          style: const TextStyle(
                                            fontSize: 20.0,
                                          )),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 10, 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              documentSnapshot['Price of Item'],
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 20),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                FirebaseFirestore.instance
                                                    .collection(
                                                        'User-Add Item')
                                                    .doc(FirebaseAuth.instance
                                                        .currentUser!.email)
                                                    .collection("item")
                                                    .doc(documentSnapshot.id)
                                                    .delete();
                                              },
                                              child: const CircleAvatar(
                                                backgroundColor: Color.fromARGB(255, 255, 255, 255),
                                                child: Icon(
                                                  size:30 ,
                                                  Icons
                                                      .delete,
                                                  color: Color.fromARGB(255, 235, 4, 4),
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
                                              Get.to(() => const Productdetailedpage(),
                                              arguments:[documentSnapshot['Price of Item'],
                                              documentSnapshot['Net Weight'],
                                              documentSnapshot['Item Name'],
                                               documentSnapshot['URl'],
                                               documentSnapshot['Item Description']
                                               ] 
                                              );
                                            },
                                            child: const Text('Details',
                                            style: TextStyle(
                                              color:  Color(0xff7f4ca5),
                                            ),),
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
                      });
                }
              } else {
                return const Center(child: CircularProgressIndicator());
              }
          },
        ),
        
      ),
    );
  }

 
}