import 'package:app_tin_tuc_cao_thang/home/settings/information.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    // _buildDR() {
    //   return Padding(
    //     padding: const EdgeInsets.only(top: 10, bottom: 10),
    //     child: Container(
    //       decoration: BoxDecoration(
    //           border: Border(
    //               bottom: BorderSide(color: Colors.grey.shade500, width: 1))),
    //       child: const Center(heightFactor: 1.5),
    //     ),
    //   );
    // }

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
                        ClipOval(
                            child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Information()));
                          },
                          child: Builder(builder: (context) {
                            // user.reload;
                            print(user.photoURL);
                            return user.photoURL != null
                                ? Image.network(
                                    user.photoURL.toString(),
                                    fit: BoxFit.fill,
                                    cacheHeight: 45,
                                    cacheWidth: 45,
                                  )
                                : Image.asset(
                                    'images/intro.jpg',
                                    fit: BoxFit.fill,
                                    cacheHeight: 45,
                                    cacheWidth: 45,
                                  );
                          }),
                        )),
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
              children: [
                Container(
                  padding: EdgeInsets.all(3.0),
                  child: Material(
                    child: ListTile(
                      title: const Text('Thông tin cá nhân'),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Information()));
                      },
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(3.0),
                  child: Material(
                    child: ListTile(
                      title: const Text('Tài khoản và mật khẩu'),
                      onTap: () {},
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(3.0),
                  child: Material(
                    child: ListTile(
                      title: const Text('Chế độ tối'),
                      onTap: () {},
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(3.0),
                  child: Material(
                    child: ListTile(
                      title: const Text('Liên hệ'),
                      onTap: () {},
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(3.0),
                  child: Material(
                    child: ListTile(
                      title: const Text('Đăng xuất'),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  content: Text('Bạn muốn đăng xuất?'),
                                  actions: [
                                    FlatButton(
                                        child: const Text('Yes'),
                                        onPressed: () {
                                          Navigator.pop(context);
                                          FirebaseAuth.instance.signOut();
                                        }),
                                    FlatButton(
                                        child: const Text('No'),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        }),
                                  ],
                                ));
                      },
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
