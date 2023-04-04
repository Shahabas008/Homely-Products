import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nihaljumailamrathaju/controllers/editproductscontroller.dart';

class Productdetailedpage extends StatefulWidget {
  const Productdetailedpage({super.key});

  @override
  State<Productdetailedpage> createState() => _ProductdetailedpageState();
}

class _ProductdetailedpageState extends State<Productdetailedpage> {
  final controller = Get.put(Editproductcontroller());
  final data = Get.arguments;
  final image = Get.arguments[3];
  final itemnames = Get.arguments[2];
  @override
  void initState() {
    super.initState();
    controller.itemnames = itemnames;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff7f4ca5),
          actions: [
            IconButton(
                onPressed: () {
                  controller.editproducts(context);
                },
                icon: const Icon(Icons.edit))
          ],
        ),
        backgroundColor: Colors.pink[200],
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      child: image == ""
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
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15),
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
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }


}
