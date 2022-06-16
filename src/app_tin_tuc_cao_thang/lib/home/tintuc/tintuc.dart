import 'package:app_tin_tuc_cao_thang/home/tintuc/chitietbaiviet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:readmore/readmore.dart';

class TinTuc extends StatefulWidget {
  const TinTuc({Key? key}) : super(key: key);

  @override
  State<TinTuc> createState() => _TinTucState();
}

class _TinTucState extends State<TinTuc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: ListView(
        children: [
          Container(
            color: Colors.blueAccent,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Image.asset(
                    'images/logo.png',
                    cacheHeight: 60,
                    cacheWidth: 270,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.search, size: 45)),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.circle, size: 45)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    'Tin tức',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent),
                  ),
                ),
                Tin(),
                Trang()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Tin extends StatefulWidget {
  const Tin({Key? key}) : super(key: key);

  @override
  State<Tin> createState() => _TinState();
}

class _TinState extends State<Tin> {
  final Stream<QuerySnapshot> posts =
      FirebaseFirestore.instance.collection('posts').snapshots();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(5),
      ),
      height: 600,
      child: StreamBuilder<QuerySnapshot>(
        stream: posts,
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

          return ListView.builder(
              itemCount: data.size,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Card(
                    child: ListTile(
                      title: ReadMoreText(
                        data.docs[index]['title'],
                        style: TextStyle(color: Colors.grey[700], fontSize: 18, fontWeight: FontWeight.bold),
                        trimLines: 1,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: '',
                        // trimExpandedText: 'Show less',
                        // moreStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      subtitle: ReadMoreText(
                        data.docs[index]['content'],
                        style: TextStyle(color: Colors.grey[700], fontSize: 16),
                        trimLines: 1,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: '',
                        // trimExpandedText: 'Show less',
                        // moreStyle: TextStyle(fontSize: 18),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChiTietBaiViet()));
                      },
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}

class Trang extends StatefulWidget {
  const Trang({Key? key}) : super(key: key);

  @override
  State<Trang> createState() => _TrangState();
}

class _TrangState extends State<Trang> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        // decoration: BoxDecoration(
        //   border: Border.all(color: Colors.grey, width: 2),
        //   borderRadius: BorderRadius.circular(5),
        // ),
        child: NumberPaginator(
          height: 40,
          numberPages: 10,
          buttonShape: BeveledRectangleBorder(),
          buttonUnselectedForegroundColor: Colors.blueAccent,
          buttonSelectedBackgroundColor: Colors.blueAccent,
          onPageChange: (int index) {
            setState(() {});
          },
        ),
      ),
    );
  }
}
