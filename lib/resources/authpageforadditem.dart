import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Authmethods3 {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> additem({
    required String itemdescription,
    required String priceofitem,
    required String netweight,
    required String bakersdescription,
    required String dropdownValue
  }) async {
    String res = "some Error occured";
    try {
      if (itemdescription.isNotEmpty ||
          priceofitem.isNotEmpty ||
          netweight.isNotEmpty ||
          bakersdescription.isNotEmpty) {
        //adding user details to the firestore
        
        await _firestore.collection('Add item').doc(dropdownValue).collection('item').add({
          "Item Description": itemdescription,
          "Price of Item": priceofitem,
          "Net Weight": netweight,
          "Baker Description": bakersdescription,
          
        });
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
