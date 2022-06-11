import 'package:app_tin_tuc_cao_thang/home/home.dart';
import 'package:flutter/material.dart';
import 'package:app_tin_tuc_cao_thang/login/login.dart';
import 'package:app_tin_tuc_cao_thang/setting/setting.dart';
import 'package:app_tin_tuc_cao_thang/login/change_password.dart';
import 'package:app_tin_tuc_cao_thang/account/change_info_account.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ChangeInfoAccount(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}
