import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nihaljumailamrathaju/create_an_account/signupforcustomer.dart';
import 'package:nihaljumailamrathaju/create_an_account/signupforseller.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

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
              backgroundColor: const Color(0xff7f4ca5),
              elevation: 0,
            )),
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                height: 200,
                width: double.infinity,
                color: const Color(0xff7f4ca5),
                child: Image.asset(
                  'assets/homebakery-bgremoved.png',
                  width: 50,
                  height: 50,
                ),
              ),
              Container(
                width: double.infinity,
                height: 200,
                color: const Color(0xffffafcc),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Choose Your Type',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )
                  ],
                ),
              ),
              // ignore: sized_box_for_whitespace
              Expanded(
                child: Container(
                  alignment: Alignment.topCenter,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  color: const Color(0xffffafcc),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff7f4ca5),
                            minimumSize: const Size(50, 50)),
                        onPressed: () {
                          Get.to(() => const Signupforseller(), arguments: {
                            "categorys": 'seller',
                          });
                        },
                        child:SizedBox(
                          height: 140,
                          child: Column(children: [
                            Image.asset("assets/sellerimage.png",
                          width: 100,
                          ),
                          const Text("Seller"),
                          ],),
                        )
                         
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff7f4ca5),
                            minimumSize: const Size(100, 100)),
                        onPressed: () {
                          Get.to(() => const Signupforcustomer(),
                              arguments: {"categorys": "customer"});
                        },
                        child:  SizedBox(
                          height: 140,
                          child: Column(children: [
                            Image.asset("assets/customerimage.png",
                          width: 100,
                          ),
                         const  SizedBox(
                            height: 20,
                          ),
                          const Text("Customer"),
                          ],),
                        )
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
