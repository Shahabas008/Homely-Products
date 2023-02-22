import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:get/get.dart';
import 'package:nihaljumailamrathaju/homepage/profilepagecustomer.dart';



class Authmethods1 {

 
  final Profilepagecustomer controller = Get.put(const Profilepagecustomer());
  


  Future<String> signUpusercustomer({
    required String email,
    required String password,
    required String username,
    required String phonenumber,
    required String address,
    required String platform,
  }) async {
    
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          phonenumber.isNotEmpty ||
          address.isNotEmpty) {
         
        //registeration of the user with email and password.
       

        //adding user details to the firestore
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(email)
            .set({
          "user name": username,
          "E-mail": email,
          "Phone number": phonenumber,
          "Address": address,
          "Password": password,
          "categorys": platform,
          
        });
      }
    } catch (err) {
     print(err);
    }
    return '';
  }
}
