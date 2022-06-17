import 'package:app_tin_tuc_cao_thang/home/settings/contact.dart';
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
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Contact()));
                      },
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
