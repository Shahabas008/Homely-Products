
import 'package:flutter/material.dart';
import 'package:nihaljumailamrathaju/resources/authpagecustomer.dart';


class Signupforcustomer extends StatefulWidget {
  const Signupforcustomer({super.key});

  @override
  State<Signupforcustomer> createState() => _SignupforcustomerState();
}

class _SignupforcustomerState extends State<Signupforcustomer> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body1(context),
    );
  }

  Widget body1(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final usernameController = TextEditingController();
    final phoneNumberController = TextEditingController();
    final addressController = TextEditingController();

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
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
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
                    controller: addressController,
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffffafcc), width: 2.0),
                      ),
                      labelText: 'Address',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffffafcc),
                              minimumSize: const Size(70, 40)),
                          child: const Text('Login'),
                          onPressed: () async {
                            String res = await Authmethods1().signUpusercustomer(
                                email: emailController.text,
                                password: passwordController.text,
                                username: usernameController.text,
                                phonenumber: phoneNumberController.text,
                                address: addressController.text);
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
