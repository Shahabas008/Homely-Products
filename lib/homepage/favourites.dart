import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Favoritepage extends StatefulWidget {
  const Favoritepage({super.key});

  @override
  State<Favoritepage> createState() => _FavoritepageState();
}

class _FavoritepageState extends State<Favoritepage> {
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
                  Image.asset(
                    'assets/homebakery-bgremoved.png',
                    width: 100,
                    height: 100,
                  ),
                ]),
            actions: [
              IconButton(
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pushNamed(context, "additem");
                  },
                  icon: const Icon(Icons.add_box)),
            ],
          )),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users-favourite-items')
            .doc(FirebaseAuth.instance.currentUser!.email)
            .collection("items")
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("Something is wrong"),
            );
          }
          if (snapshot.hasData) {
            if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
              return const Center(
                child: Text(
                  'YOU HAVE NO FAVORITES!',
                  style: TextStyle(
                    color: Color(0xff7f4ca5),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              );
            } else {
              return ListView.builder(
                  itemCount:
                      snapshot.data == null ? 0 : snapshot.data!.docs.length,
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
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          documentSnapshot['images']),
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text(documentSnapshot['name'],
                                      style: const TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold)),
                                  // ignore: prefer_interpolation_to_compose_strings
                                  Text(
                                      // ignore: prefer_interpolation_to_compose_strings
                                      'Net Weight:   ' +
                                          documentSnapshot['netweight'],
                                      style: const TextStyle(
                                        fontSize: 20.0,
                                      )),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          documentSnapshot['price'],
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 20),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            FirebaseFirestore.instance
                                                .collection(
                                                    'users-favourite-items')
                                                .doc(FirebaseAuth.instance
                                                    .currentUser!.email)
                                                .collection("items")
                                                .doc(documentSnapshot.id)
                                                .delete();
                                          },
                                          child: const CircleAvatar(
                                            backgroundColor: Colors.red,
                                            child: Icon(
                                              Icons.favorite,
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
                                          onPressed: () {},
                                          child: const Text('Order')),
                                      //       const Text(
                                      //         "barcode",
                                      //         style: TextStyle(fontSize: 15.0),
                                      //      ),
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
    );
  }
}
