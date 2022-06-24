import 'package:app_tin_tuc_cao_thang/home/settings/information.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app_tin_tuc_cao_thang/home/khoa/cntt/caulacbo.dart';
import 'package:app_tin_tuc_cao_thang/home/khoa/cntt/thuctaptotnghiep.dart';
import 'package:app_tin_tuc_cao_thang/home/khoa/cntt/doantotnghiep.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class LichThiLai extends StatefulWidget {
  const LichThiLai({Key? key}) : super(key: key);

  @override
  State<LichThiLai> createState() => _LichThiLaiState();
}

class _LichThiLaiState extends State<LichThiLai> {
  final Stream<QuerySnapshot> lichthilai=
      FirebaseFirestore.instance.collection('lichthilai').orderBy('time', descending: true).snapshots();
  final PageController _controller = PageController();
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading : false,
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
      body: Column(
        children: [
          Container(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Center(
                  child: Text('Khoa Công nghệ thông tin',
                      style: TextStyle(
                        color: Colors.red,
                      )))),
                 SizedBox(
            height: 200,
            child:
                Stack(alignment: AlignmentDirectional.bottomCenter, children: [
              PageView(
                controller: _controller,
                children: <Widget>[
                       Image.asset(
                    'images/slider8.jpg',
                    height: 150,
                    fit: BoxFit.fill,
                  ),
                  Image.asset(
                    'images/slider9.jpg',
                    height: 150,
                  ),
                  Image.asset(
                    'images/slider7.png',
                    height: 150,
                    fit: BoxFit.fill,
                  ),
                  Image.asset(
                    'images/slider4.jpg',
                    height: 150,
                  ),
                ],
              ),
              SmoothPageIndicator(
                controller: _controller,
                count: 4,
                effect: JumpingDotEffect(
                  activeDotColor: Colors.grey,
                  dotColor: Colors.grey.shade300,
                  dotHeight: 10,
                  dotWidth: 10,
                ),
              ),
            ]),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: StreamBuilder<QuerySnapshot>(
                  stream: lichthilai,
                  builder: (
                    BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot,
                  ) {
                    if (snapshot.hasError) {
                      return const Text('Something went wrong.');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Text('Loading');
                    }

                    final data = snapshot.requireData;

                    return  ListView.builder(
                        itemCount: data.size,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              title: Text(data.docs[index]['title']),
                              onTap: (){
                              },
                            ),
                          );
                        });
                  },
                ),
              ),
            ),
          ),
          Container(
            child: Column(
              children: const [
                Text('Điện thoại: 028.38212360 (33)',
                    style: TextStyle(fontSize: 16, color: Colors.black)),
                Text('Email: nvdzung@caothang.edu.vn',
                    style: TextStyle(fontSize: 16, color: Colors.black)),
                Text('Website: LichThiLai.caothang.edu.vn',
                    style: TextStyle(fontSize: 16, color: Colors.black)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
