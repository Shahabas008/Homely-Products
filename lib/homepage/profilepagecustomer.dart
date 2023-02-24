import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nihaljumailamrathaju/create_an_account/loginpage.dart';

import 'package:path/path.dart';

class Profilepagecustomer extends StatefulWidget {
  const Profilepagecustomer({super.key});

  @override
  State<Profilepagecustomer> createState() => ProfilepagecustomerState();
}

class ProfilepagecustomerState extends State<Profilepagecustomer> {
  File? _image;
   String downloadUrls = ' ';
  String imageurl = '';
  final ImagePicker picker = ImagePicker();
  String username = '  ';
  String email = '';
  String phonenumber = '';
  String address = '';

  CollectionReference collectionreference = FirebaseFirestore.instance.
  collection('Users-Profile-Picture');
  final currentuser = FirebaseAuth.instance.currentUser!.email;

  @override
    void initState() {
    super.initState();
    collectionreference.doc(currentuser).get().then((value) {
      setState(() {
        imageurl = value['Profile Picture'];
        
      });
      collectionreferencedata.doc(currentuser).get().then((value) {
        setState(() {
          username = value['user name'];
          email = value['E-mail'];
          phonenumber = value['Phone number'];
          address = value['Address'];
         
        });
      });
    });
  }
  
  CollectionReference collectionreferencedata = FirebaseFirestore.instance.
  collection('Users');
   

  Future selectOrTakePhoto(ImageSource imageSource) async {
    final pickedFile = await picker.pickImage(source: imageSource);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        uploadFile();
      } else {
        print('No photo was selected or taken');
      }
    });
  }

  Future uploadFile() async {
    if (_image == null) return;
    var fileName = basename(_image!.path);
    final destination = 'profile Picture/$fileName';

    try {
      final uploadimage = firebase_storage.FirebaseStorage.instance
          .ref(destination)
          .child('Profile Picture/');
      await uploadimage.putFile(_image!);

      downloadUrls = await uploadimage.getDownloadURL();
     final auth = FirebaseAuth.instance;
      final user = auth.currentUser!.email;
      await FirebaseFirestore.instance
          .collection('Users-Profile-Picture')
          .doc(user)
          .set({
        "Profile Picture": downloadUrls,
      });
    } on FirebaseException catch (e) {
      print(e);
    }
  }

  /// Selection dialog that prompts the user to select an existing photo or take a new one
  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            // ignore: avoid_unnecessary_containers
            child: Container(
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: const Icon(Icons.photo_library),
                      title: const Text('Gallery'),
                      onTap: () {
                        selectOrTakePhoto(ImageSource.gallery);
                        Navigator.of(context).pop();
                      }),
                  ListTile(
                    leading: const Icon(Icons.photo_camera),
                    title: const Text('Camera'),
                    onTap: () {
                      selectOrTakePhoto(ImageSource.camera);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffffafcc),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            centerTitle: true,
            title: Image.asset(
              'assets/homebakery-bgremoved.png',
              width: 100,
              height: 100,
            ),
            backgroundColor: const Color(0xff7f4ca5),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      _showPicker(context);
                    },
                    child: SizedBox(
                      height: 150,
                      width: 150,
                      child: imageurl ==  ''
                          ? Image.asset(
                              'assets/user.jpg') // set a placeholder image when no photo is set
                          : Image.network(imageurl),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Text('User Name',
               style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500 ,
               ),),
                Text(username,
                style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400 ,
               ),),


                const SizedBox(
                height: 30,
              ),
              const Text('E-Mail',
               style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500 ,
               ),),
                Text(email,
                style:const  TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400 ,
               ),),


                const SizedBox(
                height: 30,
              ),
              const Text('Phone Number',
               style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500 ,
               ),),
                Text(phonenumber,
                style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400 ,
               ),),


                const SizedBox(
                height: 30,
              ),
              const Text('Address',
               style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500 ,
               ),),
                Text(address,
                style:const  TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400 ,
               ),),
                const SizedBox(
                height: 30,),


              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff7f4ca5),
                  minimumSize: const Size(200, 30)
                ),
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    Get.to(() => const Loginpage());
                  },
                  child: const Text('Log out'))
            ],
          ),
        ),
      ),
    );
  }
}
