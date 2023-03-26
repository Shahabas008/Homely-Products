import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nihaljumailamrathaju/homepage/appbar_bottomnav.dart';
import 'package:nihaljumailamrathaju/resources/authpageforadditem.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:path/path.dart';
import 'package:get/get.dart';

List<String> listitems = <String>[
  'Cake',
  'Pudding',
  'Snack',
  'Ice Cream ',
  'Sweets',
  'Pizza'
];
List<String> listplace = <String>[
  'Malappuram',
  'Manjeri',
  'Perinthalmanna',
  'Areacode',
  'Nilambur',
  'Anakkayam'
];

class Additempage extends StatefulWidget {
  const Additempage({super.key});

  @override
  State<Additempage> createState() => _AdditempageState();
}

class _AdditempageState extends State<Additempage> {
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  File? _photo;
  final ImagePicker _picker = ImagePicker();
  String fileName = "";
  String downloadUrl = "";

  Future imgFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
        uploadFile();
      } else {
        print('No image selected.');
      }
    });
  }

  Future imgFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
        uploadFile();
      } else {
        print('No image selected.');
      }
    });
  }

  Future uploadFile() async {
    if (_photo == null) return;
    fileName = basename(_photo!.path);
    final destination = 'Add Item/$fileName';

    try {
      final uploadimage = firebase_storage.FirebaseStorage.instance
          .ref(destination)
          .child('add item/');
      await uploadimage.putFile(_photo!);
      downloadUrl = await uploadimage.getDownloadURL();
    } on FirebaseException catch (e) {
      print(e);
    }
  }

  final itemdescription = TextEditingController();
  final priceofitem = TextEditingController();
  final netweight = TextEditingController();
  final bakersdescription = TextEditingController();
  final itemname = TextEditingController();
  final formkey = GlobalKey<FormState>();

  String dropdownValue = listitems.first;
  String dropdownvalueplace = listplace.first;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Form(
      key: formkey,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff7f4ca5),
        ),
        backgroundColor: const Color(0xffffafcc),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 50, 15, 0),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: GestureDetector(
                          onTap: () {
                            _showPicker(context);
                          },
                          child: SizedBox(
                            height: 100,
                              width: 100,
                            child: CircleAvatar(
                              radius: 55,
                              backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                              child: _photo != null
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.zero,
                                      child: Image.file(
                                        _photo!,
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.fill,
                                      ),
                                    )
                                  : Container(
                                      decoration: BoxDecoration(
                                          color:  const Color.fromARGB(255, 255, 255, 255),
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      width: 100,
                                      height: 100,
                                      child:const Icon(
                                        Icons.camera_alt,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                      ),
                                    ),
                            ),
                          )))
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextFormField(
                    textCapitalization: TextCapitalization. words,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'The Field is Required';
                      } else {
                        return null;
                      }
                    },
                    controller: itemname,
                    maxLines: null,
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 255, 254, 254),
                            width: 2.0),
                      ),
                      labelText: 'Item Name',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'The Field is Required';
                      } else {
                        return null;
                      }
                    },
                    controller: itemdescription,
                    maxLines: null,
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 255, 254, 254),
                            width: 2.0),
                      ),
                      labelText: 'Item Description',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'The Field is Required';
                      } else {
                        return null;
                      }
                    },
                    controller: priceofitem,
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 255, 254, 254),
                            width: 2.0),
                      ),
                      labelText: 'Price of Item',
                    ),
                    inputFormatters: <TextInputFormatter>[
                      CurrencyTextInputFormatter(
                        locale: 'en',
                        decimalDigits: 0,
                        symbol: '₹ ',
                      ),
                    ],
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'The Field is Required';
                      } else {
                        return null;
                      }
                    },
                    controller: netweight,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 255, 254, 254),
                            width: 2.0),
                      ),
                      labelText: 'Net Weight',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'The Field is Required';
                      } else {
                        return null;
                      }
                    },
                    controller: bakersdescription,
                    maxLines: null,
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 255, 254, 254),
                            width: 2.0),
                      ),
                      labelText: 'Baker Description',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(children: [
                    DropdownButton<String>(
                      hint: const Text('Select An Item'),
                      value: dropdownValue,
                      icon: const Icon(
                        Icons.arrow_downward,
                        color: Colors.blue,
                      ),
                      elevation: 16,
                      style: const TextStyle(color: Colors.blue),
                      underline: Container(
                        height: 2,
                        color: Colors.blue,
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          dropdownValue = value!;
                        });
                      },
                      items: listitems.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ]),
                  const SizedBox(
                    height: 20,
                  ),
                   Row(children: [
                    DropdownButton<String>(
                      hint: const Text('Select An Item'),
                      value: dropdownvalueplace,
                      icon: const Icon(
                        Icons.arrow_downward,
                        color: Colors.blue,
                      ),
                      elevation: 16,
                      style: const TextStyle(color: Colors.blue),
                      underline: Container(
                        height: 2,
                        color: Colors.blue,
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          dropdownvalueplace = value!;
                        });
                      },
                      items: listplace.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ])
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                   style: ElevatedButton.styleFrom(
                    backgroundColor:  const Color(0xff7f4ca5),
                   ),
                      onPressed: () async {
                        String res = await Authmethods3().additem(
                            itemname: itemname.text,
                            itemdescription: itemdescription.text,
                            priceofitem: priceofitem.text,
                            netweight: netweight.text,
                            bakersdescription: bakersdescription.text,
                            dropdownValue: dropdownValue,
                            productionplace : dropdownvalueplace,
                            fileName: fileName,
                            downloadUrl: downloadUrl);

                        debugPrint(res);
                        if (formkey.currentState!.validate()) {
                           Get.to(()=> const Homepagelayout());
                          Get.showSnackbar(GetSnackBar(
                            margin: const EdgeInsets.all(15),
                            borderRadius: 8,
                            message: 'Product Added Successfully!',
                            backgroundColor: Colors.green.shade400,
                            duration: const Duration(seconds: 3),
                          ));
                        } else {
                          Get.showSnackbar(const GetSnackBar(
                            margin: EdgeInsets.all(15),
                            borderRadius: 8,
                            message: 'Product isn\'t stored',
                            backgroundColor: Colors.red,
                            duration: Duration(seconds: 3),
                          ));
                        }
                      },
                      child: const Text('Submit'))
                ],
              )
            ]),
          ),
        ),
      ),
    ));
  }

  void  _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            // ignore: avoid_unnecessary_containers
            child: Container(
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: const Icon(Icons.photo_library),
                      title: const Text('Gallery'),
                      onTap: () {
                        imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  ListTile(
                    leading: const Icon(Icons.photo_camera),
                    title: const Text('Camera'),
                    onTap: () {
                      imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
