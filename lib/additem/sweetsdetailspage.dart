import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Sweetdetailspage extends StatelessWidget {
  final String id;

  const Sweetdetailspage(this.id, {super.key});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance
        .collection('Add item')
        .doc('Sweets')
        .collection('item');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(id).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return SafeArea(
              child: Scaffold(
            backgroundColor: Colors.pink[200],
            body: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: Image.asset(
                        'assets/cakeimage.jpg',
                        width: 200,
                        height: 200,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['Item Name'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      data['Item Description'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'PRICE :',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      data['Price of Item'],
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      'NET WEIGHT (in KG.) :',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      data['Net Weight'],
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      'BAKER :',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      data['Baker Description'],
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {

                          },
                          child: const Text('Add to Cart'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            
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

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
