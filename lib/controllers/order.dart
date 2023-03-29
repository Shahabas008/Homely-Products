import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Orderpage extends GetxController{
   order(BuildContext context){
     showDialog(
      context: context,
      builder: (context) {
        return   AlertDialog(
          title: const Text("The product is ordered."),
          actions: [
            IconButton(onPressed: (){
              navigator!.pop();
            }, icon:const Icon(Icons.check))
          ],
        );
      },
      
      
    );
  }
}