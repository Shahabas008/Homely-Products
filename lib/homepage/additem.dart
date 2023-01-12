import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nihaljumailamrathaju/resources/authpageforadditem.dart';
import 'package:nihaljumailamrathaju/resources/storage_service.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';

List<String> list = <String>[
  'Cake',
  'Pudding',
  'Snack',
  'Ice Cream ',
  'Sweets',
  'Pizza'
];

class Additempage extends StatefulWidget {
  const Additempage({super.key});

  @override
  State<Additempage> createState() => _AdditempageState();
}

class _AdditempageState extends State<Additempage> {
  final itemdescription = TextEditingController();
  final priceofitem = TextEditingController();
  final netweight = TextEditingController();
  final bakersdescription = TextEditingController();

  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    final Storage storage = Storage();
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xffffafcc),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 50, 15, 0),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(200, 50)),
                  onPressed: () async {
                    final results = await FilePicker.platform.pickFiles(
                      allowMultiple: false,
                      type: FileType.custom,
                      allowedExtensions: ["png", "jpg", "jpge", "heic"],
                    );
                    if (results == null) {
                      snackfalse();
                    } else {
                      snacktrue();
                    }

                    final path = results!.files.single.path;
                    final filename = results.files.single.name;
                    print(path);
                    print(filename);

                   storage
                        .uploadFile(path!, filename)
                        .then((value) => print('Done'));
               
                  },
                  icon: const Icon(Icons.upload),
                  label: const Text('Upload An Image'),
                ),
                /*FutureBuilder(
                    future: storage.downloadURL('IMG_20230107_234346.jpg'),
                    builder: (BuildContext context, AsyncSnapshot<String> snapshot){
                    if(snapshot.connectionState == ConnectionState.done && snapshot.hasData){
                      return SizedBox(
                        width: 20,
                        height: 20,
                        child: Image.network(snapshot.data!,
                        fit: BoxFit.cover,),
                      );
            
                    }
                    if(snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData){
                      return const CircularProgressIndicator();
                    }
                   return Container();
                    })*/
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextFormField(
                  controller: itemdescription,
                  maxLines: null,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 255, 254, 254),
                          width: 2.0),
                    ),
                    labelText: 'Item Description',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: priceofitem,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 255, 254, 254),
                          width: 2.0),
                    ),
                    labelText: 'Price of Item',
                  ),
                  inputFormatters: <TextInputFormatter>[
                    CurrencyTextInputFormatter(
                      locale: 'en',
                      decimalDigits: 0,
                      symbol: '₹ ',
                    ),
                  ],
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: netweight,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 255, 254, 254),
                          width: 2.0),
                    ),
                    labelText: 'Net Weight',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: bakersdescription,
                  maxLines: null,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 255, 254, 254),
                          width: 2.0),
                    ),
                    labelText: 'Baker Description',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(children: [
                  DropdownButton<String>(
                    hint: const Text('Select An Item'),
                    value: dropdownValue,
                    icon: const Icon(
                      Icons.arrow_downward,
                      color: Colors.blue,
                    ),
                    elevation: 16,
                    style: const TextStyle(color: Colors.blue),
                    underline: Container(
                      height: 2,
                      color: Colors.blue,
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        dropdownValue = value!;
                      });
                    },
                    items: list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ])
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                    onPressed: () async {
                      String res = await Authmethods3().additem(
                        itemdescription: itemdescription.text,
                        priceofitem: priceofitem.text,
                        netweight: netweight.text,
                        bakersdescription: bakersdescription.text,
                        dropdownValue: dropdownValue,
                      );

                      debugPrint(res);
                      push();
                    },
                    child: const Text('Submit'))
              ],
            )
          ]),
        ),
      ),
    ));
  }

  void push() {
    Navigator.pushNamed(context, "homelayout");
  }

  void snackfalse() {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('NO File Selected.')));
  }

  void snacktrue() {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('File Uploaded!')));
  }
}
