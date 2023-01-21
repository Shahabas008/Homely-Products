import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:razorpay_flutter/razorpay_flutter.dart';


class Razorpaypage extends StatefulWidget {
  const Razorpaypage({super.key});

  @override
  State<Razorpaypage> createState() => _RazorpaypageState();
}

void _handlePaymentSuccess(PaymentSuccessResponse response) {
  Fluttertoast.showToast(msg: "SUCCESSFULL PAYMENT!");
}

void _handlePaymentError(PaymentFailureResponse response) {
  Fluttertoast.showToast(msg: "SOMETHING WENT WRONG!");
}

void _handleExternalWallet(ExternalWalletResponse response) {
   Fluttertoast.showToast(msg: "SUCCESSFULL PAYMENT!");
}



class _RazorpaypageState extends State<Razorpaypage> {
  Razorpay? _razorpay;

  @override
  void initState() {
   
    super.initState();
    _razorpay = Razorpay();
    _razorpay?.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay?.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay?.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

void makePayment() async{
  var options = {
  'key': '<YOUR_KEY_HERE>',
  'amount': 100,
  'name': 'Acme Corp.',
  'description': 'Fine T-Shirt',
  'prefill': {
    'contact': '8888888888',
    'email': 'test@razorpay.com'
  }
};

try{
  _razorpay?.open(options);
}catch(e){
  debugPrint(e.toString());
}

}


  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(onPressed: (){
        makePayment() ;
      }, child: const Text('click')),
    );
  }
}