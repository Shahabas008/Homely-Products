import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nihaljumailamrathaju/create_an_account/loginpage.dart';
import 'package:nihaljumailamrathaju/create_an_account/verifyemail.dart';

import 'package:nihaljumailamrathaju/resources/authpagecustomer.dart';

class Signupforcustomer extends StatefulWidget {
  const Signupforcustomer({super.key});

  @override
  State<Signupforcustomer> createState() => _SignupforcustomerState();
}

class _SignupforcustomerState extends State<Signupforcustomer> {
  final categorys = Get.arguments["categorys"];
  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  final usernameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final addressController = TextEditingController();

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
                              prefixIcon: Icon(Icons.account_circle)),
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
                              prefixIcon: Icon(Icons.email)),
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
                              prefixIcon: Icon(Icons.phone)),
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
                              prefixIcon: Icon(Icons.home)),
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
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xffffafcc), width: 2.0),
                              ),
                              labelText: 'Login Password',
                              prefixIcon: const Icon(Icons.password),
                              suffixIcon: IconButton(
                                onPressed: _toggle,
                                icon: _obscureText
                                    ? const Icon(Icons.visibility)
                                    : const Icon(Icons.visibility_off),
                              )),
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
                              focusedBorder:  OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xffffafcc), width: 2.0),
                              ),
                              labelText: 'Confirm \n Login Password',
                              prefixIcon:  Icon(Icons.password),),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color.fromARGB(
                                        255, 226, 119, 158),
                                    minimumSize: const Size(70, 40)),
                                child: const Text('Verify submit and Login'),
                                onPressed: () async {
                                  try {
                                    final FirebaseAuth auth =
                                        FirebaseAuth.instance;
                                    await auth.createUserWithEmailAndPassword(
                                        email: emailController.text,
                                        password: passwordController.text);
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
                                            "email": emailController.text,
                                          });
                                      Get.showSnackbar(
                                        GetSnackBar(
                                          margin: const EdgeInsets.all(15),
                                          borderRadius: 8,
                                          message: 'Registration Succeeded',
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
                            
                                }),
                          ],
                        ),
                         Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          const Text('Already have an Account?'),
                          TextButton(onPressed:() {
                             Get.to(() =>const Loginpage());
                          }, child: const Text('Sign In',
                          style: TextStyle(
                            color:  Color.fromARGB(
                                    255, 226, 119, 158),
                                    fontSize: 20
                          ),))

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
