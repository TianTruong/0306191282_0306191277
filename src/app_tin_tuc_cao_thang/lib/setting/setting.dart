import 'dart:async';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {


  
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
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[
                  Container(
                    padding: EdgeInsets.all(3.0),
                    child: Material(
                      child: ListTile(
                        title: const Text('Thông tin cá nhân'),
                         onLongPress: (){},
                      ),
                    ),
                  ),
                      Container(
                    padding: EdgeInsets.all(3.0),
                    child: Material(
                      child: ListTile(
                        title: const Text('Tài khoản và mật khẩu'),
                         onLongPress: (){},
                      ),
                    ),
                  ),
                      Container(
                    padding: EdgeInsets.all(3.0),
                    child: Material(
                      child: ListTile(
                        title: const Text('Chế độ tối'),
                         onLongPress: (){},
                      ),
                    ),
                  ),
                      Container(
                    padding: EdgeInsets.all(3.0),
                    child: Material(
                      child: ListTile(
                        title: const Text('Liên hệ'),
                         onLongPress: (){},
                      ),
                    ),
                  ),
                      Container(
                    padding: EdgeInsets.all(3.0),
                    child: Material(
                      child: ListTile(
                        title: const Text('Đăng xuất'),
                         onLongPress: (){},
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}