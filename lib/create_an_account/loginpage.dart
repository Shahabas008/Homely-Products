import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nihaljumailamrathaju/create_an_account/reset_password.dart';
import 'package:nihaljumailamrathaju/create_an_account/signuppage.dart';

import 'package:nihaljumailamrathaju/homepage/appbar_bottomnav.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Something went WRONG!'),
              );
            } else if (snapshot.hasData) {
              return const Homepagelayout();
            } else {
              return Form(
                key: _formKey,
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: ListView(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(10),
                        ),
                        Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                              'assets/homebakery.png',
                              width: 200,
                              height: 200,
                            )),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: TextFormField(
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
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter Password!';
                              }
                              return null;
                            },
                            obscureText: _obscureText,
                            controller: passwordController,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.password),
                              suffixIcon: IconButton(
                                onPressed: _toggle,
                                icon: _obscureText
                                    ? const Icon(Icons.visibility)
                                    : const Icon(Icons.visibility_off),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xffffafcc), width: 2.0),
                              ),
                              labelText: 'Password',
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextButton(
                          onPressed: () {
                            Get.to(() => const Resetpasswordpage());
                          },
                          child: const Text(
                            'Forgot Password',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                            height: 50,
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 226, 119, 158)),
                              child: const Text('Login'),
                              onPressed: () {
                                signIn();
                              },
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text('Doesn\'t have account?'),
                            TextButton(
                              child: const Text(
                                'Sign UP',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black),
                              ),
                              onPressed: () {
                                Get.to(() => const Signup());
                              },
                            )
                          ],
                        ),
                      ],
                    )),
              );
            }
          }),
    );
  }

  Future signIn() async {
    final navigator = Navigator.of(context);
    showDialog(
        context: context,
        builder: ((context) {
          return const Center(
              child: CircularProgressIndicator(
            color: Colors.purple,
          ));
        }));
    _formKey.currentState!.validate();

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());

      Get.showSnackbar(GetSnackBar(
        margin: const EdgeInsets.all(15),
        borderRadius: 8,
        backgroundColor: Colors.green.shade400,
        message: 'Logged In Successfully',
        duration: const Duration(seconds: 2),
      ));
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "invalid-email":
          return Get.showSnackbar(
            const GetSnackBar(
              margin: EdgeInsets.all(15),
              borderRadius: 8,
              message:
                  ('Your username or password is incorrect. Please try again.'),
              duration: Duration(seconds: 3),
              backgroundColor: Colors.red,
            ),
          );

        case "wrong-password":
          return Get.showSnackbar(
            const GetSnackBar(
              margin: EdgeInsets.all(15),
              borderRadius: 8,
              message: ('The password is invalid for the given email'),
              duration: Duration(seconds: 3),
              backgroundColor: Colors.red,
            ),
          );

        case "user-not-found":
          return Get.showSnackbar(
            const GetSnackBar(
              margin: EdgeInsets.all(15),
              borderRadius: 8,
              message: ('There is no user corresponding to the given email.'),
              duration: Duration(seconds: 3),
              backgroundColor: Colors.red,
            ),
          );
      }
    }

    navigator.pop();
  }
}
