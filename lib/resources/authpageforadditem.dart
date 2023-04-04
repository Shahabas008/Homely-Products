import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authmethods3 {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final currentuser = FirebaseAuth.instance.currentUser!.email;
  Future<String> additem({
    required String itemname,
    required String itemdescription,
    required String priceofitem,
    required String netweight,
    required String bakersdescription,
    required String dropdownValue,
    required fileName,
    required downloadUrl,
    required String productionplace,
  }) async {
    try {
      if (itemdescription.isNotEmpty ||
          priceofitem.isNotEmpty ||
          netweight.isNotEmpty ||
          bakersdescription.isNotEmpty) {
        //adding user details to the firestore

        await _firestore
            .collection('Add item')
            .doc(dropdownValue)
            .collection('item')
            .add({
          "Item Name": itemname,
          "Item Description": itemdescription,
          "Price of Item": priceofitem,
          "Net Weight": netweight,
          "Baker Description": bakersdescription,
          "URl": downloadUrl,
          "Image Name": fileName,
          'place': productionplace
        });

        await _firestore
            .collection('User-Add Item')
            .doc(currentuser)
            .collection('item').doc(itemname)
            .set({
          "Item Name": itemname,
          "Item Description": itemdescription,
          "Price of Item": priceofitem,
          "Net Weight": netweight,
          "Baker Description": bakersdescription,
          "URl": downloadUrl,
          "Image Name": fileName,
        });

        await _firestore
            .collection('Filter-Location')
            .doc(productionplace)
            .collection(dropdownValue)
            .add({
          "Item Name": itemname,
          "Item Description": itemdescription,
          "Price of Item": priceofitem,
          "Net Weight": netweight,
          "Baker Description": bakersdescription,
          "URl": downloadUrl,
          "Image Name": fileName,
          'place': productionplace
        });
      }
    } catch (err) {
      print(err);
    }
    return '';
  }
}
