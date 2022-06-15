// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, file_names, non_constant_identifier_names

import 'package:app_tin_tuc_cao_thang/home/settings/information.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PhongHCQT extends StatefulWidget {
  const PhongHCQT({Key? key}) : super(key: key);

  @override
  State<PhongHCQT> createState() => _PhongHCQTState();
}

class _PhongHCQTState extends State<PhongHCQT> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    _DuongKeNgang() {
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
                _DuongKeNgang(),
                const TinMoiCapNhat(),
                const SizedBox(height: 15),
                const TinNoiBat(),
                _DuongKeNgang(),
                const LienHe()
              ],
            ),
          ),
        ],
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
                    fontSize: 20,
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
                'Tin nổi bật',
                style: TextStyle(
                    fontSize: 20,
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
          Text('Điện thoại: 028.38212360 (11)',
              style: TextStyle(fontSize: 16, color: Colors.black)),
          Text('Email: ktcaothang@caothang.edu.vn',
              style: TextStyle(fontSize: 16, color: Colors.black)),
          Text('Website: hcqt.caothang.edu.vn',
              style: TextStyle(fontSize: 16, color: Colors.black)),
        ],
      ),
    );
  }
}
