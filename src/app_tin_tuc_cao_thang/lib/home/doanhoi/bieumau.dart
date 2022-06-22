// ignore_for_file: prefer_const_constructors

import 'package:app_tin_tuc_cao_thang/home/settings/information.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BieuMau extends StatefulWidget {
  const BieuMau({Key? key}) : super(key: key);

  @override
  State<BieuMau> createState() => _BieuMauState();
}

class _BieuMauState extends State<BieuMau> {
  final Stream<QuerySnapshot> bieumau=
      FirebaseFirestore.instance.collection('bieumau').orderBy('time', descending: true).snapshots();
  final PageController _controller = PageController();
  int i = 0;
  int number=3;
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading : false,
        title: Image.asset(
          'images/logo.png',
          cacheHeight: 40,
          cacheWidth: 180,
        ),
        actions: [
          Row(
            children: [
              Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: 40,
                  height: 40,
                  child: IconButton(
                      icon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => TinTuc(),
                        //     ));
                      })),
              SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: ClipOval(
                    child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Information()));
                  },
                  child: user.photoURL != null
                      ? Image.network(
                          user.photoURL.toString(),
                          fit: BoxFit.fill,
                          cacheHeight: 40,
                          cacheWidth: 40,
                        )
                      : Image.asset(
                          'images/intro.jpg',
                          fit: BoxFit.fill,
                          cacheHeight: 40,
                          cacheWidth: 40,
                        ),
                )),
              ),
            ],
          ),
        ],
      ),
      backgroundColor: Colors.grey.shade200,
      body: Column(
        children: [
          Container(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Center(
                  child: Text('Đoàn hội',
                      style: TextStyle(
                        color: Colors.red,
                      )))),
     
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: StreamBuilder<QuerySnapshot>(
                  stream: bieumau,
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

                    return  Column(
            children: [
              Expanded(
                child: ListView.builder(
                        itemCount: data.size,
                        itemBuilder: (context, index) {
                          return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                           mainAxisAlignment: MainAxisAlignment.start,
                            children:[
                              Container(   
                                 padding: EdgeInsets.fromLTRB(3, 5, 3, 5), 
                                child:Text(data.docs[index]['title'],
                                  style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                         
                                          ),
                                ),
                              Container(  
                                padding: EdgeInsets.fromLTRB(3, 5, 3, 5), 
                              child: Text(data.docs[index]['des']), 
                            ),
                            ]  
                            
                          );
                        }
                        ),
              ),
                 number < data.size
                  ? TextButton(
                      onPressed: () {
                        setState(() {
                          number = number + 1;
                        });
                      },
                      child: Text('Xem thêm'))
                  : TextButton(
                      onPressed: () {
                        setState(() {
                          number = 3;
                        });
                      },
                      child: Text('Rút gọn'))
                   ]
                );
                  },
                ),
              ),
            ),
          ),
      
        ],
      ),
    );
  }
}
