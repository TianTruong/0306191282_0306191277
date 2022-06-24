import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:app_tin_tuc_cao_thang/login/sign_in.dart';
import 'package:app_tin_tuc_cao_thang/login/sign_up.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: const SignIn(),

    );
    
  }
}
