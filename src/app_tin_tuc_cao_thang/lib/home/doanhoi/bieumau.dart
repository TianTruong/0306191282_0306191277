import 'package:app_tin_tuc_cao_thang/home/settings/information.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BieuMau extends StatefulWidget {
  const BieuMau({Key? key}) : super(key: key);

  @override
  State<BieuMau> createState() => _BieuMauState();
}

class _BieuMauState extends State<BieuMau> {
  int number = 3;

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> bieumau = FirebaseFirestore.instance
        .collection('bieumau')
        .orderBy('time', descending: true)
        .snapshots();

    return Container(
      // decoration: BoxDecoration(
      //   border: Border.all(color: Colors.blue, width: 3),
      //   borderRadius: BorderRadius.circular(10),
      // ),
      height: 250,
      child: StreamBuilder<QuerySnapshot>(
        stream: posts,
        builder: (
          BuildContext context,
          AsyncSnapshot<QuerySnapshot> snapshot,
        ) {
          if (snapshot.hasError) {
            return const Text('Something went wrong.');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.requireData;

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: number,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            title: Text(
                              data.docs[index]['title'],
                              style: TextStyle(
                                  // color: Colors.grey[700],
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            // ReadMoreText(
                            //   data.docs[index]['title'],
                            //   style: TextStyle(
                            //       color: Colors.grey[700],
                            //       fontSize: 18,
                            //       fontWeight: FontWeight.bold),
                            //   trimLines: 1,
                            //   trimMode: TrimMode.Line,
                            //   trimCollapsedText: '',
                            //   // trimExpandedText: 'Show less',
                            //   // moreStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            // ),

                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => ChiTietBaiViet()));
                            },
                          ),
                        ),
                      );
                    }),
              ),
              number < data.size
                  ? TextButton(
                      onPressed: () {
                        setState(() {
                          number = number + 1;
                        });
                      },
                      child: Text('Xem thêm'))
                  : TextButton(
                      onPressed: () {
                        setState(() {
                          number = 3;
                        });
                      },
                      child: Text('Rút gọn'))
            ],
          );
        },
      ),
    );
  }
}