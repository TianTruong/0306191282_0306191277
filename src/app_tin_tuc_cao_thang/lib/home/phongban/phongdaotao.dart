// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

class PhongDaoTao extends StatefulWidget {
  const PhongDaoTao({Key? key}) : super(key: key);

  @override
  State<PhongDaoTao> createState() => _PhongDaoTaoState();
}

class _PhongDaoTaoState extends State<PhongDaoTao> {
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
      backgroundColor: Colors.grey.shade300,
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
                  // decoration: BoxDecoration(
                  //   border: Border.all(color: Colors.blue, width: 3),
                  //   borderRadius: BorderRadius.circular(10),
                  // ),
                  height: 200,
                  child: Image.asset(
                    'images/TuyenSinh.jpg',
                    height: 200,
                    fit: BoxFit.fill,
                  ),
                ),
                _buildDR(),
                BuildButton(),
                _buildDR(),
                ListPost(),
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

class BuildButton extends StatelessWidget {
  const BuildButton({Key? key}) : super(key: key);

  _containerBTN(String label) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.blue, width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
        width: 75,
        height: 100,
        child: FlatButton(
            child: Text(label,
                style: TextStyle(color: Colors.black, fontSize: 12)),
            onPressed: () {}));
  }

  _containerBTN2(String label) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.blue, width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
        width: 160,
        height: 120,
        child: FlatButton(
            child: Text(label,
                style: TextStyle(color: Colors.black, fontSize: 12)),
            onPressed: () {}));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   border: Border.all(color: Colors.blue, width: 3),
      //   borderRadius: BorderRadius.circular(10),
      // ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _containerBTN('Thời khóa biểu'),
              _containerBTN('Lịch thi'),
              _containerBTN('Lịch đào tạo'),
              _containerBTN('Chương trình đào tạo'),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _containerBTN2('Đăng ký học kỳ phụ hè 2021'),
              _containerBTN2('Lịch phát bằng tốt nghiệp - Cấp bảng điểm'),
            ],
          ),
        ],
      ),
    );
  }
}

class ListPost extends StatelessWidget {
  const ListPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(5),
      ),
      height: 300,
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

class LienHe extends StatelessWidget {
  const LienHe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: const [
          Text('Điện thoại: 028.38212360 (17)',
              style: TextStyle(fontSize: 16, color: Colors.black)),
          Text('Email: daotao@caothang.edu.vn',
              style: TextStyle(fontSize: 16, color: Colors.black)),
          Text('Website: daotao.caothang.edu.vn',
              style: TextStyle(fontSize: 16, color: Colors.black)),
        ],
      ),
    );
  }
}
