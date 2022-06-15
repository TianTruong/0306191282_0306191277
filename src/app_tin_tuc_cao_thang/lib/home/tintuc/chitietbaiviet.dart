// ignore_for_file: prefer_const_constructors

import 'package:app_tin_tuc_cao_thang/home/settings/information.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChiTietBaiViet extends StatefulWidget {
  const ChiTietBaiViet({Key? key}) : super(key: key);

  @override
  State<ChiTietBaiViet> createState() => _ChiTietBaiVietState();
}

class _ChiTietBaiVietState extends State<ChiTietBaiViet> {
  final user = FirebaseAuth.instance.currentUser!;

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
                        ClipOval(
                            child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Information()));
                          },
                          child: Builder(builder: (context) {
                            // user.reload;
                            print(user.photoURL);
                            return user.photoURL != null
                                ? Image.network(
                                    user.photoURL.toString(),
                                    fit: BoxFit.fill,
                                    cacheHeight: 45,
                                    cacheWidth: 45,
                                  )
                                : Image.asset(
                                    'images/intro.jpg',
                                    fit: BoxFit.fill,
                                    cacheHeight: 45,
                                    cacheWidth: 45,
                                  );
                          }),
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(padding: const EdgeInsets.all(10.0), child: BaiViet()),
          Padding(padding: const EdgeInsets.all(10.0), child: NutBinhLuan()),
        ],
      ),
    );
  }
}

class BaiViet extends StatefulWidget {
  const BaiViet({Key? key}) : super(key: key);

  @override
  State<BaiViet> createState() => _BaiVietState();
}

class _BaiVietState extends State<BaiViet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(5),
      ),
      height: 600,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Center(
              child: Text(
                'Tiêu đề bài viết',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              'Nội dung bài viết: Flutter là mobile UI framework của Google để tạo ra các giao diện chất lượng cao trên iOS và Android trong khoảng thời gian ngắn. Flutter hoạt động với những code sẵn có được sử dụng bởi các lập trình viên, các tổ chức.',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Image.asset(
              'images/LogoChinh.png',
              cacheHeight: 150,
              cacheWidth: 150,
              fit: BoxFit.contain,
            ),
          )
        ],
      ),
    );
  }
}

class NutBinhLuan extends StatefulWidget {
  const NutBinhLuan({Key? key}) : super(key: key);

  @override
  State<NutBinhLuan> createState() => _NutBinhLuanState();
}

class _NutBinhLuanState extends State<NutBinhLuan> {
  @override
  Widget build(BuildContext context) {
    return Container(
        // decoration: BoxDecoration(
        //   border: Border.all(color: Colors.grey, width: 2),
        //   borderRadius: BorderRadius.circular(5),
        // ),
        child: ElevatedButton(
      child: Text('Bình luận'),
      onPressed: () {},
    ));
  }
}
