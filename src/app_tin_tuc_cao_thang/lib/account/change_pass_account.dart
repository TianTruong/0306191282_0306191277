// ignore_for_file: avoid_print, prefer_final_fields, sized_box_for_whitespace, must_be_immutable

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app_tin_tuc_cao_thang/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:app_tin_tuc_cao_thang/home/settings.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  var _passController = TextEditingController();
  var _passnewController = TextEditingController();
  var _passConfirmController = TextEditingController();
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
        .get().catchError((error) {});
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
                      padding: const EdgeInsets.all(5.0),
                      child: TextFormField(
                        controller: _passnewController,
                         obscureText: true,
                          enableSuggestions: false,
                         autocorrect: false,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 5),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 61, 97, 216),
                                    width: 3)),
                            hintText: 'Mật khẩu mới'),
                        keyboardType: TextInputType.text,
                      ),
                    ),
               Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextFormField(
                        controller: _passConfirmController,
                         obscureText: true,
                          enableSuggestions: false,
                         autocorrect: false,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 5),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 61, 97, 216),
                                    width: 3)),
                            hintText: 'Nhập lại mật khẩu mới'),
                        keyboardType: TextInputType.text,
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
                  'Thay đổi',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              onPressed: () {
          
                if(_passnewController.text.trim()==_passConfirmController.text.trim()&&_passnewController.text.trim().isNotEmpty&&_passConfirmController.text.trim().isNotEmpty){
                user.updatePassword(_passnewController.text.trim());
                createUserInFirestore();
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            content: Text('Thay đổi thành công'),
                            actions: [
                              FlatButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                               
                                   Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
                 
                      }),
                        ],
                 ));
                }else{
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        content: Text('Mật khẩu không trùng khớp'),
                        actions: [
                          FlatButton(
                              child: const Text('OK'),
                              onPressed: () {
                                setState(() {
                                  Navigator.pop(context);
                                });
                              }),
                        ],
                      ));
                }
              
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
           
             Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
                 
              }),
        ],
      ),
    );
  }
}



  
 