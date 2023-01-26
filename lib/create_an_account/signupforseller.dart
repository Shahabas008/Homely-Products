import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nihaljumailamrathaju/homepage/appbar_bottomnav.dart';
import 'package:nihaljumailamrathaju/resources/authpageseller.dart';
import 'package:path/path.dart';

class Signupforseller extends StatefulWidget {
  const Signupforseller({super.key});

  @override
  State<Signupforseller> createState() => _SignupforsellerState();
}

class _SignupforsellerState extends State<Signupforseller> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  File? _photo;
  final ImagePicker _picker = ImagePicker();

  String downloadUrl = "";
  Future imgFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path());
        uploadFile();
      } else {
        print('No image selected.');
      }
    });
  }

  Future imgFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path());
        uploadFile();
      } else {
        print('No image selected.');
      }
    });
  }

  Future uploadFile() async {
    if (_photo == null) return;
    var fileName = basename(_photo!.path);
    final destination = 'files/$fileName';

    try {
      final uploadimage = firebase_storage.FirebaseStorage.instance
          .ref(destination)
          .child('Licence Images/');
      await uploadimage.putFile(_photo!);
      downloadUrl = await uploadimage.getDownloadURL();
    } on FirebaseException catch (e) {
      print(e);
    }
  }

  void _showPicker(context) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body1(context),
    );
  }

  Widget body1(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(30),
            child: AppBar(
              backgroundColor: const Color(0xffffafcc),
              elevation: 0,
            )),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: 180,
                  width: double.infinity,
                  color: const Color(0xffffafcc),
                  child: Image.asset(
                    'assets/homebakery-bgremoved.png',
                    width: 50,
                    height: 50,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 600,
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextFormField(
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return 'The field is required';
                          } else if (value.length < 4) {
                            return 'Enter at least 4 characters';
                          } else {
                            return null;
                          }
                        }),
                        controller: usernameController,
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xffffafcc), width: 2.0),
                          ),
                          labelText: 'User Name',
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        validator: ((value) {
                          if (value!.length < 10 || value.isEmpty) {
                            return 'Enter a valid 10 digits mobile number';
                          } else {
                            return null;
                          }
                        }),
                        controller: phoneNumberController,
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xffffafcc), width: 2.0),
                          ),
                          labelText: 'Phone Number',
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty || !value.contains('@')) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                        controller: emailController,
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xffffafcc), width: 2.0),
                          ),
                          labelText: 'E-Mail',
                        ),
                      ),
                      TextFormField(
                        validator: ((value) {
                          if (value!.length < 6) {
                            return 'Password is too short';
                          } else {
                            return null;
                          }
                        }),
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xffffafcc), width: 2.0),
                          ),
                          labelText: 'Login Password',
                        ),
                      ),
                      TextFormField(
                        validator: ((value) {
                          if (value != passwordController.text) {
                            return 'The password don\'t match ';
                          } else {
                            return null;
                          }
                        }),
                        obscureText: true,
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xffffafcc), width: 2.0),
                          ),
                          labelText: 'Confirm \n Login Password',
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(100, 50),
                                backgroundColor: const Color(0xffffafcc),
                              ),
                              onPressed: () {
                                _showPicker(context);
                              },
                              child: const Text('Upload YOur License')),
                          SizedBox(
                              height: 40,
                              width: 60,
                              child: Image.network(
                                downloadUrl,
                                fit: BoxFit.fill,
                              ))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xffffafcc),
                                  minimumSize: const Size(70, 40)),
                              child: const Text('Login'),
                              onPressed: () async {
                                await Authmethods2().signUpuserseller(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    username: usernameController.text,
                                    phonenumber: phoneNumberController.text,
                                    downloadUrl: downloadUrl);
                                if (formKey.currentState!.validate()) {
                                  Get.to(const Homepagelayout());
                                  Get.showSnackbar(
                                    GetSnackBar(
                                      margin: const EdgeInsets.all(15),
                                      borderRadius: 8,
                                      title: 'Registration Succeeded',
                                      message:
                                          'You\'re A Seller, Sell good Products.',
                                      duration: const Duration(seconds: 5),
                                      backgroundColor: Colors.green.shade400,
                                    ),
                                  );
                                } else {
                                  Get.showSnackbar(
                                    const GetSnackBar(
                                      margin: EdgeInsets.all(15),
                                      borderRadius: 8,
                                      message: 'Registration Failed!',
                                      icon: Icon(Icons.error),
                                      duration: Duration(seconds: 3),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                }
                              }),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
