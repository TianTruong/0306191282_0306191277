import 'package:app_tin_tuc_cao_thang/home/settings/information.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Noti extends StatefulWidget {
  const Noti({Key? key}) : super(key: key);

  @override
  State<Noti> createState() => _NotiState();
}

class _NotiState extends State<Noti> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
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
      body: const Center(
        child: Text('Notification'),
      ),
    );
  }
}
