import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Authmethods2 {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signUpuserseller({
    required String email,
    required String password,
    required String username,
    required String phonenumber,
    required String downloadUrl,
  }) async {
   
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          phonenumber.isNotEmpty) {
        //registeration of the user with email and password.
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        //adding user details to the firestore
        await _firestore
            .collection('Users')
            .doc("Sellers")
            .collection("user")
            .doc(email)
            .set({
          "user name": username,
          "E-mail": email,
          "Phone number": phonenumber,
          "Password": password,
          "uid": cred.user!.uid,
          "Categorys": 'Seller',
          "Licence Image":downloadUrl,
        });
      }
    } catch (err) {
     print(err);
    }
    return '';
  }
}
