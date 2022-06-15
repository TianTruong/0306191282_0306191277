// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          child: Text(
            'Liên hệ',
            style: TextStyle(color: Colors.redAccent, fontSize: 24),
          ),
        ),
        Expanded(
            child: ListView(
          children: [
            Text(
              'Trường',
              style: TextStyle(color: Colors.redAccent, fontSize: 20),
            ),
            ListTile(
              title: Text('65 Huỳnh Thúc Kháng, P.Bến Nghé, Q.1, Tp.HCM'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text('Điện thoại: 028 38 212 868 - 028 38 212 360'),
                Text('Email: ktcaothang@caothang.edu.vn'),
                Text('Website: caothang.edu.vn'),
              ]),
            ),
            Text(
              'Phòng ban',
              style: TextStyle(color: Colors.redAccent, fontSize: 20),
            ),
            Text(
              'Khoa - bộ môn',
              style: TextStyle(color: Colors.redAccent, fontSize: 20),
            ),
          ],
        ))
      ]),
    );
  }
}
