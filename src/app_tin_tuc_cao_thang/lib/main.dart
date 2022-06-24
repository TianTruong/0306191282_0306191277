import 'package:app_tin_tuc_cao_thang/home/khoa/bomonkinhte.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:app_tin_tuc_cao_thang/login/sign_in.dart';
import 'package:app_tin_tuc_cao_thang/home/khoa/cntt.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // fontFamily: 'AidaSerifObliqueMedium',
        primarySwatch: Colors.blue,
      ),
<<<<<<< HEAD
      home: const CNTT(),
=======
      home: const SignIn(),
>>>>>>> ea70bc6bf8351252d1be0fe432d1c4866ef452dc
    );
  }
}
