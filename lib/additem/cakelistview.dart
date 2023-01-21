import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nihaljumailamrathaju/additem/cakedetailspage.dart';


class Cakelistview extends StatefulWidget {
  const Cakelistview({super.key});

  @override
  State<Cakelistview> createState() => _CakelistviewState();
}

class _CakelistviewState extends State<Cakelistview> {
  @override
  Widget build(BuildContext context) {
    var firestore = FirebaseFirestore.instance;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xfffcf6f5),
        floatingActionButton: null,
        body: StreamBuilder<QuerySnapshot>(
          stream: firestore
              .collection('Add item')
              .doc('Cake')
              .collection('item')
              .orderBy('Price of Item', descending: true)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              final snap = snapshot.data!.docs;
              return ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                    child: Card(
                      color: Colors.pink[200],
                      margin: const EdgeInsets.all(20),
                      child: Container(
                        height: 120,
                        padding: const EdgeInsets.all(0),
                        child: Row(children: [
                          Expanded(
                            flex: 6,
                            child: Container(
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/cakeimage.jpg"),
                                      fit: BoxFit.fill)),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text(snap[index]['Item Name'],
                                      style: const TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold)),
                                  Row(
                                    children: const <Widget>[
                                      /*Text(
                                    'Barcode : ',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "barcode",
                                    style: TextStyle(fontSize: 15.0),
                                  ),*/
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        snap[index]['Price of Item'],
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15),
                                      ),
                                    ],
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        TextButton(
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          Cakedetailspage(
                                                              snapshot
                                                                  .data!
                                                                  .docs[index]
                                                                  .id,
                                                                  product: snap[index],)));
                                            },
                                            child: const Text("Details")),
                                         TextButton(
                                            onPressed: (){
                                          
                                            },
                                            child: const Icon(Icons.shopping_cart)),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ),
                  );
                },
                itemCount: snap.length,
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
