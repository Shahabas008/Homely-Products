import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class Storage {
  final FirebaseStorage storage = FirebaseStorage.instance;

  Future<void> uploadFile(
    String filepath,
    String filename,
  ) async {
    File file = File(filepath);

    try {
      await storage.ref('cakes/$filename').putFile(file);
    } on FirebaseException catch (e) {
      print(e);
    }
  }

  Future<String> downloadURL(String imageName) async {
     String downloadURL = await storage.ref('cakes/$imageName').getDownloadURL();

     return downloadURL;
  }
}
