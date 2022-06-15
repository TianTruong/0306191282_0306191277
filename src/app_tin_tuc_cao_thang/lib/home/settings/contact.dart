import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          child: Text('Liên hệ'),
        ),
        Expanded(
            child: ListView(
          children: [],
        ))
      ]),
    );
  }
}
