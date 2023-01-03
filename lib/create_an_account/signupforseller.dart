import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:nihaljumailamrathaju/resources/authpageseller.dart';

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

  late XFile? selectedimage;

  _imgFromCamera() async {
    XFile? image = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 50);

    setState(() {
      selectedimage = image;
    });
  }

  _imgFromGallery() async {
    XFile? image = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      selectedimage = image;
    });
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
                      title: const Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  ListTile(
                    leading: const Icon(Icons.photo_camera),
                    title: const Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
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
    return Center(
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
                    controller: usernameController,
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffffafcc), width: 2.0),
                      ),
                      labelText: 'User Name',
                    ),
                  ),
                  TextFormField(
                    controller: phoneNumberController,
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffffafcc), width: 2.0),
                      ),
                      labelText: 'Phone Number',
                    ),
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffffafcc), width: 2.0),
                      ),
                      labelText: 'E-Mail',
                    ),
                  ),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffffafcc), width: 2.0),
                      ),
                      labelText: 'Login Password',
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffffafcc), width: 2.0),
                      ),
                      labelText: 'Confirm \n Login Password',
                    ),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(100, 50),
                        backgroundColor: const Color(0xffffafcc),
                      ),
                      onPressed: () {
                        _showPicker(context);
                      },
                      child: const Text('Upload YOur License')),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffffafcc),
                              minimumSize: const Size(70, 40)),
                          child: const Text('Login'),
                          onPressed: () async {
                            String res = await Authmethods2().signUpuserseller(
                              email: emailController.text,
                              password: passwordController.text,
                              username: usernameController.text,
                              phonenumber: phoneNumberController.text,
                            );
                            debugPrint(res);
                          }),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
