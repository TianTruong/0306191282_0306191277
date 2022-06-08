// ignore_for_file: avoid_unnecessary_containers, camel_case_types, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';

class PhongCTCT_HSSV extends StatefulWidget {
  const PhongCTCT_HSSV({Key? key}) : super(key: key);

  @override
  State<PhongCTCT_HSSV> createState() => _PhongCTCT_HSSVState();
}

class _PhongCTCT_HSSVState extends State<PhongCTCT_HSSV> {
  
  @override
  Widget build(BuildContext context) {
    _buildDR() {
      return Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.grey.shade500, width: 1))),
          child: const Center(heightFactor: 1.5),
        ),
      );
    }

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
              children: [
                Container(
                  height: 200,
                  child: Image.asset(
                    'images/TuyenSinh.jpg',
                    height: 200,
                    fit: BoxFit.fill,
                  ),
                ),
                _buildDR(),
                SoTaySinhVien(),
                SizedBox(height: 15),
                TinMoiCapNhat(),
                SizedBox(height: 15),
                TinNoiBat(),
                _buildDR(),
                LienHe()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SoTaySinhVien extends StatelessWidget {
  const SoTaySinhVien({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue.shade300,
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: const [
            Text(
              'Sổ tay sinh viên',
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            Card(
              child: ListTile(
                title: Text('Sổ tay sinh viên'),
                trailing: Icon(Icons.arrow_forward, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TinMoiCapNhat extends StatefulWidget {
  const TinMoiCapNhat({Key? key}) : super(key: key);

  @override
  State<TinMoiCapNhat> createState() => _TinMoiCapNhatState();
}

class _TinMoiCapNhatState extends State<TinMoiCapNhat> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(5),
      ),
      height: 250,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text(
                'Tin mới cập nhật',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent),
              ),
            ),
            Expanded(
              child: ListView(
                children: const [
                  Card(
                    child: ListTile(
                      title: Text('Tiêu đề bài viết'),
                      subtitle: Text('Nội dung bài viết'),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text('Tiêu đề bài viết'),
                      subtitle: Text('Nội dung bài viết'),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text('Tiêu đề bài viết'),
                      subtitle: Text('Nội dung bài viết'),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text('Tiêu đề bài viết'),
                      subtitle: Text('Nội dung bài viết'),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text('Tiêu đề bài viết'),
                      subtitle: Text('Nội dung bài viết'),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text('Tiêu đề bài viết'),
                      subtitle: Text('Nội dung bài viết'),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text('Tiêu đề bài viết'),
                      subtitle: Text('Nội dung bài viết'),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text('Tiêu đề bài viết'),
                      subtitle: Text('Nội dung bài viết'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TinNoiBat extends StatefulWidget {
  const TinNoiBat({Key? key}) : super(key: key);

  @override
  State<TinNoiBat> createState() => _TinNoiBatState();
}

class _TinNoiBatState extends State<TinNoiBat> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(5),
      ),
      height: 250,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text(
                'Thông tin hoạt động',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent),
              ),
            ),
            Expanded(
              child: ListView(
                children: const [
                  Card(
                    child: ListTile(
                      title: Text('Tiêu đề bài viết'),
                      subtitle: Text('Nội dung bài viết'),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text('Tiêu đề bài viết'),
                      subtitle: Text('Nội dung bài viết'),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text('Tiêu đề bài viết'),
                      subtitle: Text('Nội dung bài viết'),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text('Tiêu đề bài viết'),
                      subtitle: Text('Nội dung bài viết'),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text('Tiêu đề bài viết'),
                      subtitle: Text('Nội dung bài viết'),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text('Tiêu đề bài viết'),
                      subtitle: Text('Nội dung bài viết'),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text('Tiêu đề bài viết'),
                      subtitle: Text('Nội dung bài viết'),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text('Tiêu đề bài viết'),
                      subtitle: Text('Nội dung bài viết'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LienHe extends StatelessWidget {
  const LienHe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: const [
          Text('Điện thoại: 028.38212360 (12)',
              style: TextStyle(fontSize: 16, color: Colors.black)),
          Text('Email: ctct.hssv@caothang.edu.vn',
              style: TextStyle(fontSize: 16, color: Colors.black)),
          Text('Website: ctct.caothang.edu.vn',
              style: TextStyle(fontSize: 16, color: Colors.black)),
        ],
      ),
    );
  }
}
