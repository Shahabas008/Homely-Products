import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Authmethods1 {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  


  Future<String> signUpusercustomer({
    required String email,
    required String password,
    required String username,
    required String phonenumber,
    required String address,
  }) async {



    String res = "some Error occured";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          phonenumber.isNotEmpty ||
          address.isNotEmpty) {
        //registeration of the user with email and password.
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        //adding user details to the firestore
        await _firestore.collection('Users').doc("Customers").collection("user").doc(cred.user!.uid).set({
          "user name": username,
          "E-mail": email,
          "Phone number": phonenumber,
          "Address": address,
          "Password": password,
          "uid": cred.user!.uid,
        });
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
