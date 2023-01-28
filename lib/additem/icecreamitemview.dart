import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nihaljumailamrathaju/additem/icecreamdetailspage.dart';

class Icecreamlistview extends StatefulWidget {
  const Icecreamlistview({super.key});

  @override
  State<Icecreamlistview> createState() => _IcecreamlistviewState();
}

class _IcecreamlistviewState extends State<Icecreamlistview> {
  @override
  Widget build(BuildContext context) {
    var firestore = FirebaseFirestore.instance;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff7f4ca5),
        ),
        backgroundColor: const Color(0xfffcf6f5),
        floatingActionButton: null,
        body: StreamBuilder<QuerySnapshot>(
          stream: firestore
              .collection('Add item')
              .doc('Ice Cream ')
              .collection('item')
              .orderBy('Price of Item', descending: true)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              if(snapshot.data!.docs.isEmpty || snapshot.data == null){
                return const Center(
                child: Text(
                  '                  OOPS! \n NO PRODUCTS TO SHOW.',
                  style: TextStyle(
                    color: Color(0xff7f4ca5),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              );}
               
               else{
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
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(snap[index]['URl']),
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
                                                          Icecreamdetailspage(
                                                              snapshot
                                                                  .data!
                                                                  .docs[index]
                                                                  .id,
                                                                  product: snap[index])));
                                            },
                                            child: const Text("Details")),
                                        const TextButton(
                                            onPressed: null,
                                            child: Icon(Icons.shopping_cart)),
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
              );}
              
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
