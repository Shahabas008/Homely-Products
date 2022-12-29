import 'package:flutter/material.dart';

class Signupforcustomer extends StatelessWidget {
  const Signupforcustomer({super.key});

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
                children:  [
                  const TextField(
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffffafcc), width: 2.0),
                      ),
                      labelText: 'User Name',
                    ),
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffffafcc), width: 2.0),
                      ),
                      labelText: 'Phone Number',
                    ),
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffffafcc), width: 2.0),
                      ),
                      labelText: 'Address',
                    ),
                  ),
                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffffafcc), width: 2.0),
                      ),
                      labelText: 'Login Password',
                    ),
                  ),
                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
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
                      
                        backgroundColor:const Color(0xffffafcc),
                        minimumSize: const Size(70, 40)
                      ),
                      child: const Text('Login'),
                      onPressed: (){
                         Navigator.pushNamed(context, "homelayout");
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
