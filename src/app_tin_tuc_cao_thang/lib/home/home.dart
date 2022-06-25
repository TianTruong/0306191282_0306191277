// ignore_for_file: must_be_immutable

import 'package:app_tin_tuc_cao_thang/home/news.dart';
import 'package:app_tin_tuc_cao_thang/home/notification.dart';
import 'package:app_tin_tuc_cao_thang/home/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  var screens = const [News(), Noti(), Settings()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CupertinoTabScaffold(
        resizeToAvoidBottomInset: true,
        tabBar: CupertinoTabBar(
          backgroundColor: Colors.blueAccent,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.news_solid, color: Colors.white),
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.bell_solid, color: Colors.white),
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings, color: Colors.white),
            )
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          return screens[index];
        },
      ),
    );
  }
}
