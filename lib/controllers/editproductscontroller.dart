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

  void editproducts(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: AlertDialog(
              title: const Text("Edit"),
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
                    onPressed: () {},
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
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),
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
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),
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
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),
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
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),
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
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),
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
}
