import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Editproductcontroller extends GetxController {
  final formkey = GlobalKey<FormState>();
  final itemdescription = TextEditingController();
  final itemname = TextEditingController();
  final bakersdescription = TextEditingController();
  final netweight = TextEditingController();
  final pricofitem = TextEditingController();
  String itemnames = "";

  void editproducts(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: AlertDialog(
              title: const Text("Edit Item Details"),
              actions: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 161, 46, 46)),
                    onPressed: () {
                      navigator!.pop();
                    },
                    child: const Text('Back')),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 153, 153, 153)),
                    onPressed: () {
                      updateselleritems();
                      Get.back();
                      itemname.clear();
                      itemdescription.clear();
                      netweight.clear();
                      pricofitem.clear();
                      bakersdescription.clear();
                    },
                    child: const Text('Done')),
              ],
              content: Form(
                key: formkey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextFormField(
                        textCapitalization: TextCapitalization.words,
                        // focusNode: myFocusNode,
                        controller: itemname,
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return 'The field is required';
                          } else {
                            return null;
                          }
                        }),
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xffffafcc), width: 2.0),
                          ),
                          labelText: 'Enter Item Name',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: itemdescription,
                        textCapitalization: TextCapitalization.words,
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return 'The field is required';
                          } else {
                            return null;
                          }
                        }),
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xffffafcc), width: 2.0),
                          ),
                          labelText: 'Enter Item description',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        controller: netweight,
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return 'The field is required';
                          } else {
                            return null;
                          }
                        }),
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xffffafcc), width: 2.0),
                          ),
                          labelText: 'Enter Net weight',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        controller: pricofitem,
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return 'The field is required';
                          } else {
                            return null;
                          }
                        }),
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xffffafcc), width: 2.0),
                          ),
                          labelText: 'Enter Price of Item',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        textCapitalization: TextCapitalization.words,
                        controller: bakersdescription,
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return 'The field is required';
                          } else {
                            return null;
                          }
                        }),
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xffffafcc), width: 2.0),
                          ),
                          labelText: 'Enter Baker\'s description',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  //updating the information of the seller items details
  void updateselleritems() {
    FirebaseFirestore.instance
        .collection("User-Add Item")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection("item")
        .doc(itemnames)
        .update({
      "Baker Description": bakersdescription.text,
      "Item Description": itemdescription.text,
      "Item Name": itemname.text,
      "Net Weight": netweight.text,
      "Price of Item": pricofitem.text
    });
  }
}
