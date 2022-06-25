// ignore_for_file: avoid_print, prefer_const_constructors, sized_box_for_whitespace

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Information extends StatelessWidget {
  const Information({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> user =
        FirebaseFirestore.instance.collection('users').snapshots();

    final users = FirebaseAuth.instance.currentUser!;

    _saveImage(ImageSource source) async {
      final ImagePicker _picker = ImagePicker();

      Reference ref =
          FirebaseStorage.instance.ref().child('avatar/${users.uid}');

      final XFile? image = await _picker.pickImage(source: source);

      var img = File(image!.path);

      await ref.putFile(img);

      var downloadURL = await ref.getDownloadURL();

      print(downloadURL);
    }

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(users.displayName!,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
            height: 500,
            child: StreamBuilder<QuerySnapshot>(
              stream: user,
              builder: (
                BuildContext context,
                AsyncSnapshot<QuerySnapshot> snapshot,
              ) {
                if (snapshot.hasError) {
                  return const Text('Something went wrong.');
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text('Loading');
                }

                final data = snapshot.requireData;
                print(data.size);

                for (int i = 0; i <= data.size; i++) {
                  if (data.docs[i]['uid'] == users.uid) {
                    return ListView(
                      children: [
                        Center(
                          child: ClipOval(
                              child: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) => Container(
                                        height: 150,
                                        child: Column(
                                          children: [
                                            ListTile(
                                              leading:
                                                  const Icon(Icons.camera_alt),
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
                              return data.docs[i]['avatar'] != ''
                                  ? Image.network(
                                      data.docs[i]['avatar'],
                                      fit: BoxFit.fill,
                                      cacheHeight: 180,
                                      cacheWidth: 180,
                                    )
                                  : Image.asset(
                                      'images/intro.jpg',
                                      fit: BoxFit.fill,
                                      cacheHeight: 180,
                                      cacheWidth: 180,
                                    );
                            }),
                          )),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Card(
                          child: ListTile(
                            title: Text('Tên: ${data.docs[i]['name']}'),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            title: Text('MSSV: ${data.docs[i]['mssv']}'),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            title: Text('Giới tính: ${data.docs[i]['sex']}'),
                          ),
                        ),
                      ],
                    );
                  }
                }
                return Container();
              },
            )),
      ),
    );
  }
}
