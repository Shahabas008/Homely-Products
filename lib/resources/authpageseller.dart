import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:nihaljumailamrathaju/controllers/profilepagesellercontroller.dart';




class Authmethods2 {
  final data =  Get.put(TestController());

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signUpuserseller({
    required String email,
    required String password,
    required String username,
    required String phonenumber,
    required String downloadUrls,
    required String platform,
  }) async {
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          phonenumber.isNotEmpty) {
        //registeration of the user with email and password.

        //adding user details to the firestore
        await _firestore.collection('Users').doc(email).set({
          "user name": username,
          "E-mail": email,
          "Phone number": phonenumber,
          "Password": password,
          "Categorys": platform,
          "Licence Image": downloadUrls,
        
        });
      }
    } catch (err) {
      print(err);
    }
    return '';
  }
}
