import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nihaljumailamrathaju/create_an_account/verifyemail.dart';

import 'package:nihaljumailamrathaju/resources/authpagecustomer.dart';

class Signupforcustomer extends StatefulWidget {
  const Signupforcustomer({super.key});

  @override
  State<Signupforcustomer> createState() => _SignupforcustomerState();
}

class _SignupforcustomerState extends State<Signupforcustomer> {
  final categorys = Get.arguments["categorys"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body1(context),
    );
  }

  Widget body1(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmpasswordController = TextEditingController();
    final usernameController = TextEditingController();
    final phoneNumberController = TextEditingController();
    final addressController = TextEditingController();

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
          child: Center(
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
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
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
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          validator: (value) {
                            if (value!.isEmpty || !value.contains('@')) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
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
                            if (value!.length < 10 || value.isEmpty) {
                              return 'Enter a valid 10 digits mobile number';
                            } else {
                              return null;
                            }
                          }),
                          keyboardType: TextInputType.number,
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
                          validator: ((value) {
                            if (value!.isEmpty) {
                              return 'The field is required';
                            } else {
                              return null;
                            }
                          }),
                          controller: addressController,
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xffffafcc), width: 2.0),
                            ),
                            labelText: 'Address',
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
                          controller: confirmpasswordController,
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
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color.fromARGB(
                                        255, 226, 119, 158),
                                    minimumSize: const Size(70, 40)),
                                child: const Text('Login'),
                                onPressed: () async {
                                  try {
                                    final FirebaseAuth auth =
                                        FirebaseAuth.instance;
                                    await auth.createUserWithEmailAndPassword(
                                        email: emailController.text,
                                        password: passwordController.text);
                                    await Authmethods1().signUpusercustomer(
                                        email: emailController.text,
                                        password: passwordController.text,
                                        username: usernameController.text,
                                        phonenumber: phoneNumberController.text,
                                        address: addressController.text,
                                        platform: categorys);
                                       
                                    if (formKey.currentState!.validate()) {
                                      Get.to(const Verifyemailpage(),
                                      arguments: {
                                        "email":emailController.text,
                                      });
                                      Get.showSnackbar(
                                        GetSnackBar(
                                          margin: const EdgeInsets.all(15),
                                          borderRadius: 8,
                                         
                                          message:
                                              'Registration Succeeded',
                                          duration: const Duration(seconds: 5),
                                          backgroundColor:
                                              Colors.green.shade400,
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
                                  } on FirebaseAuthException catch (e) {
                                    switch (e.code) {
                                      case 'email-already-in-use':
                                        Get.showSnackbar(
                                          const GetSnackBar(
                                            margin: EdgeInsets.all(15),
                                            borderRadius: 8,
                                            message:
                                                ('There already exists an account with the given email address.'),
                                            duration: Duration(seconds: 3),
                                            backgroundColor: Colors.red,
                                          ),
                                        );
                                    }
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
      ),
    );
  }
}
