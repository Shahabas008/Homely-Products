import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:nihaljumailamrathaju/homepage/profilepagecustomer.dart';



class Authmethods1 {

  final FirebaseAuth _auth = FirebaseAuth.instance;
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
            print(email);
        //registeration of the user with email and password.
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

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
          "uid": cred.user!.uid,
          "categorys": platform,
          
        });
      }
    } catch (err) {
     print(err);
    }
    return '';
  }
}
