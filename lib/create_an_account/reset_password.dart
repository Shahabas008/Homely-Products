import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nihaljumailamrathaju/create_an_account/loginpage.dart';

class Resetpasswordpage extends StatefulWidget {
  const Resetpasswordpage({super.key});

  @override
  State<Resetpasswordpage> createState() => _ResetpasswordpageState();
}

class _ResetpasswordpageState extends State<Resetpasswordpage> {
  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Reset Password'),
        backgroundColor: const Color(0xff7f4ca5),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
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
                     enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color:Color(0xff7f4ca5)),
                      ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xff7f4ca5), width: 2.0),
                    ),
                    labelText: 'E-Mail',
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(200, 40),
                      backgroundColor: const Color(0xff7f4ca5),
                    ),
                    child: const Text('Reset Password'),
                    onPressed: () {
                      reset();
                    },
                  )),
            ],
          ),
        ),
      ),
    ));
  }

  void reset() {
    final emails = emailController.text;
    if (_formKey.currentState!.validate()) {
      FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text);
      Get.off(() => const Loginpage());
      Get.showSnackbar( GetSnackBar(
        message: 'An Mail is sent to the $emails',
        margin:  const EdgeInsets.all(15),
        borderRadius: 8,
        duration:  const Duration(seconds: 5),
        backgroundColor: Colors.green.shade400,
      ));
    }
  }
}
