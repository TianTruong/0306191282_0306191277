import 'package:app_tin_tuc_cao_thang/home/settings/information.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AnhHoatDong extends StatefulWidget {
  const AnhHoatDong({Key? key}) : super(key: key);

  @override
  State<AnhHoatDong> createState() => _AnhHoatDongState();
}

class _AnhHoatDongState extends State<AnhHoatDong> {
  final Stream<QuerySnapshot> anhhoatdong = FirebaseFirestore.instance
      .collection('anhhoatdongdoanhoi')
      .orderBy('time', descending: true)
      .snapshots();
  final PageController _controller = PageController();
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
                      icon: const Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      onPressed: () {})),
              const SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: ClipOval(
                    child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Information()));
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
              child: const Center(
                  child: Text('Hình ảnh hoạt động',
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
                    'images/slider11.jpg',
                    height: 150,
                    fit: BoxFit.fill,
                  ),
                  Image.asset(
                    'images/slider12.jpg',
                    height: 150,
                  ),
                  Image.asset(
                    'images/slider13.jpg',
                    height: 150,
                    fit: BoxFit.fill,
                  ),
                ],
              ),
              SmoothPageIndicator(
                controller: _controller,
                count: 3,
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
                  stream: anhhoatdong,
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

                    return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 400,
                                childAspectRatio: 3 / 2,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20),
                        itemCount: data.size,
                        itemBuilder: (context, index) {
                          return InkWell(
                            child: Container(
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(5.0),
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      data.docs[index]['title'],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Image.network(
                                      data.docs[index]['image'],
                                      cacheHeight: 200,
                                      cacheWidth: 300,
                                    ),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                          );
                        });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
