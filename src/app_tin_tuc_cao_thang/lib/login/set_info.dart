// ignore_for_file: avoid_print, prefer_final_fields, sized_box_for_whitespace, must_be_immutable

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app_tin_tuc_cao_thang/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SetInfor extends StatefulWidget {
  const SetInfor({Key? key}) : super(key: key);

  @override
  State<SetInfor> createState() => _SetInforState();
}

class _SetInforState extends State<SetInfor> {
  var _nameController = TextEditingController();
  var _mssvController = TextEditingController();
  var _sexController = TextEditingController();
  bool check = false;
  late String avatar = '';
  String sex = 'Nam';
  var items = [
    'Nam',
    'Nữ',
  ];

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  final user = FirebaseAuth.instance.currentUser!;

  void createUserInFirestore() {
    users
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
        .limit(1)
        .get()
        .then(
      (QuerySnapshot querySnapshot) {
        if (querySnapshot.docs.isEmpty) {
          users.add({
            'name': _nameController.text,
            'mssv': _mssvController.text,
            'sex': sex,
            'avatar': avatar,
            'status': 'Available',
            'uid': user.uid
          });
        }
      },
    ).catchError((error) {});
  }

  _saveImage(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();

    Reference ref = FirebaseStorage.instance.ref().child('avatar/${user.uid}');

    final XFile? image = await _picker.pickImage(source: source);

    var img = File(image!.path);

    await ref.putFile(img);

    var downloadURL = await ref.getDownloadURL();
    check = true;
    avatar = downloadURL;

    print(downloadURL);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipOval(
              child: InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) => Container(
                        height: 150,
                        child: Column(
                          children: [
                            ListTile(
                              leading: const Icon(Icons.camera_alt),
                              title: const Text('Camera'),
                              onTap: () async {
                                Navigator.of(context).pop();
                                _saveImage(ImageSource.camera);
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.image),
                              title: const Text('Gallery'),
                              onTap: () async {
                                Navigator.of(context).pop();
                                _saveImage(ImageSource.gallery);
                              },
                            )
                          ],
                        ),
                      ));
            },
            child: Builder(builder: (context) {
              return avatar != ''
                  ? Image.network(
                      avatar,
                      fit: BoxFit.cover,
                      cacheHeight: 150,
                      cacheWidth: 150,
                    )
                  : Image.asset(
                      'images/intro.jpg',
                      fit: BoxFit.cover,
                      cacheHeight: 150,
                      cacheWidth: 150,
                    );
            }),
          )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 50),
            child: TextFormField(
              controller: _nameController,
              cursorColor: const Color(0xFF08C187),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.black, width: 5),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          const BorderSide(color: Color(0xFF08C187), width: 3)),
                  hintText: 'Họ và tên ...'),
              keyboardType: TextInputType.text,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 50),
            child: TextFormField(
              controller: _mssvController,
              cursorColor: const Color(0xFF08C187),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.black, width: 5),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          const BorderSide(color: Color(0xFF08C187), width: 3)),
                  hintText: 'MSSV ...'),
              keyboardType: TextInputType.text,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 50),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: DropdownButton(
                  value: sex,
                  icon: const Icon(Icons.arrow_drop_down),
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  isExpanded: true,
                  onChanged: (String? newValue) {
                    setState(() {
                      sex = newValue!;
                    });
                  },
                ),
              ),
            ),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 61, 97, 216),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: Text(
                  'Tiếp tục',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              onPressed: () {
                user.updateDisplayName(_nameController.text);
                user.updatePhotoURL(avatar);

                createUserInFirestore();

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              }),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 61, 97, 216),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: Text(
                  'Thoát',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              onPressed: () {
                FirebaseAuth.instance.currentUser!.delete();
                FirebaseAuth.instance.signOut();
              }),
        ],
      ),
    );
  }
}
