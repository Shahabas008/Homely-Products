import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

class TestController extends GetxController {
  RxString downloadUrls = "".obs;
  
  

  Future uploadFile(image) async {
    if (image == null) return;
    var fileName = basename(image!.path);
    final destination = 'profile Picture/$fileName';

    try {
      final uploadimage = FirebaseStorage.instance
          .ref(destination)
          .child('Profile Picture/');
      await uploadimage.putFile(image!);

       downloadUrls.value = await uploadimage.getDownloadURL();
       print(downloadUrls.value);

    } on FirebaseException catch (e) {
      print(e);
    }
  }
  
}