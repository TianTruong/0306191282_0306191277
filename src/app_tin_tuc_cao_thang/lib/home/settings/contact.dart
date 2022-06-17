// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:app_tin_tuc_cao_thang/home/settings/information.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  Contact({Key? key}) : super(key: key);
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    buildContact(name, phone, mail, website) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 7,
                    offset: const Offset(0, 5))
              ]),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
              title: Text(name,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text('Điện thoại: $phone'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text('Email: $mail'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text('Website: $website'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }

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
            child: Container(
              height: 700,
              child: Column(children: [
                Container(
                  child: Text('Liên hệ',
                      style: TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          fontFamily: 'AidaSerifObliqueMedium'))
                ),
                Expanded(
                    child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Text('Trường',
                          style: TextStyle(
                              color: Colors.redAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              fontFamily: 'AidaSerifObliqueMedium')),
                    ),
                    buildContact(
                        '65 Huỳnh Thúc Kháng, P.Bến Nghé, Q.1, Tp.HCM',
                        '028 38 212 868 - 028 38 212 360',
                        'ktcaothang@caothang.edu.vn',
                        'caothang.edu.vn'),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Text('Phòng ban',
                          style: TextStyle(
                              color: Colors.redAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              fontFamily: 'AidaSerifObliqueMedium')),
                    ),
                    buildContact('Phòng Đào tạo', '028.38212360 (17)',
                        'daotao@caothang.edu.vn', 'daotao.caothang.edu.vn'),
                    buildContact('Phòng Tài chính - Kế toán', '028.39143051',
                        'tcktcaothang@caothang.edu.vn', 'tckt.caothang.edu.vn'),
                    buildContact('Phòng CTCT - HSSV', '028.38212360 (12)',
                        'ctct.hssv@caothang.edu.vn', 'ctct.caothang.edu.vn'),
                    buildContact(
                        'Phòng Hành chính - Quản trị',
                        '028.38212360 (11)',
                        'ktcaothang@caothang.edu.vn',
                        'hcqt.caothang.edu.vn'),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Text('Khoa, bộ môn',
                          style: TextStyle(
                              color: Colors.redAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              fontFamily: 'AidaSerifObliqueMedium')),
                    ),
                    buildContact('Khoa Cơ khí', '028.38212360',
                        'cokhi@caothang.edu.vn', 'ck.caothang.edu.vn'),
                    buildContact(
                        'Khoa Cơ khí động lực',
                        '028.38212360 ',
                        'nguyenngocthanh@caothang.edu.vn',
                        'ckdl.caothang.edu.vn'),
                    buildContact('Khoa Điện - Điện tử', '028.38212360 ',
                        'pvthanh@caothang.edu.vn ', 'ddt.caothang.edu.vn'),
                    buildContact(
                        'Khoa Công nghệ Nhiệt - Lạnh',
                        '028.38212360 ',
                        'lequanghuy@caothang.edu.vn ',
                        'nhietlanh.caothang.edu.vn'),
                    buildContact(
                        'Khoa Công nghệ thông tin',
                        '028.38212360 (33) ',
                        'nvdzung@caothang.edu.vn ',
                        'cntt.caothang.edu.vn'),
                    buildContact('Khoa Giáo dục đại cương', '028.38212360  ',
                        'phamdinhhuan@caothang.edu.vn', 'gddc.caothang.edu.vn'),
                    buildContact('Bộ môn Kinh tế', '028.38212360',
                        'kinhte@caothang.edu.vn ', 'kinhte.caothang.edu.vn'),
                  ],
                ))
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
