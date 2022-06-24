// ignore_for_file: prefer_const_constructors

import 'package:app_tin_tuc_cao_thang/home/settings/information.dart';
import 'package:app_tin_tuc_cao_thang/home/tintuc/binhluan.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class ChiTietBaiViet extends StatefulWidget {
  const ChiTietBaiViet(
      {Key? key,
      required this.idBaiViet,
      required this.title,
      required this.like})
      : super(key: key);
  final String idBaiViet, title;
  final int like;

  @override
  State<ChiTietBaiViet> createState() => _ChiTietBaiVietState();
}

class _ChiTietBaiVietState extends State<ChiTietBaiViet> {
  final user = FirebaseAuth.instance.currentUser!;
  bool liked = false;

  @override
  Widget build(BuildContext context) {
    var posts =
        FirebaseFirestore.instance.collection('posts').doc(widget.idBaiViet);

    int like = widget.like;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
      body: ListView(
        children: [
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: BaiViet(
                title: widget.title,
              )),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(primary: Colors.grey.shade300),
            onPressed: () {
              liked ? like = like - 1 : like = like + 1;

              posts.update({
                'like': like,
              });

              setState(() {
                liked ? liked = false : liked = true;
              });
            },
            icon: liked
                ? const Icon(
                    Icons.thumb_up_outlined,
                    size: 25,
                    color: Colors.blue,
                  )
                : const Icon(Icons.thumb_up_outlined,
                    size: 25, color: Colors.black),
            label: liked
                ? Text('${like} Đã thích',
                    style: TextStyle(fontSize: 15, color: Colors.blue))
                : Text('${like} Thích',
                    style: TextStyle(fontSize: 15, color: Colors.black)),
          ),
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: NutBinhLuan(
                idBaiViet: widget.idBaiViet,
              )),
        ],
      ),
    );
  }
}

class BaiViet extends StatefulWidget {
  const BaiViet({Key? key, required this.title}) : super(key: key);
  final String title;

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
                widget.title,
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
  const NutBinhLuan({Key? key, required this.idBaiViet}) : super(key: key);
  final String idBaiViet;

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
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BinhLuan(idBaiViet: widget.idBaiViet)));
      },
    ));
  }
}
