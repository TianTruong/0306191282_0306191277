import 'package:app_tin_tuc_cao_thang/home/settings/information.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BinhLuan extends StatefulWidget {
  const BinhLuan({Key? key, required this.idPhong, required this.idBaiViet})
      : super(key: key);
  final String idPhong;
  final String idBaiViet;
  @override
  State<BinhLuan> createState() => _BinhLuanState();
}

class _BinhLuanState extends State<BinhLuan> {
  CollectionReference comment =
      FirebaseFirestore.instance.collection('departments');
  var commentDocId;

  @override
  void initState() {
    super.initState();
  }
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
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      'Bình luận',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent),
                    ),
                  ),
                ),
                Tin(
                  idPhong: widget.idPhong,
                  idBaiViet: widget.idBaiViet,
                ),
                VietBinhLuan(
                  idPhong: widget.idPhong,
                  idBaiViet: widget.idBaiViet,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Tin extends StatefulWidget {
  const Tin({Key? key, required this.idPhong, required this.idBaiViet})
      : super(key: key);
  final String idPhong, idBaiViet;
  @override
  State<Tin> createState() => _TinState();
}

class _TinState extends State<Tin> {
  final Stream<QuerySnapshot> posts =
      FirebaseFirestore.instance.collection('posts').snapshots();

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> commets = FirebaseFirestore.instance
        .collection('departments')
        .doc(widget.idPhong)
        .collection('posts')
        .doc(widget.idBaiViet)
        .collection('comments')
        .orderBy('time', descending: true)
        .snapshots();

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(5),
      ),
      height: 600,
      child: StreamBuilder<QuerySnapshot>(
        stream: commets,
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

          return ListView.builder(
              itemCount: data.size,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Card(
                    child: ListTile(
                      title: Text(data.docs[index]['userSend']),
                      subtitle: Text(data.docs[index]['comment']),
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => ChiTietBaiViet()));
                      },
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}

class VietBinhLuan extends StatefulWidget {
  const VietBinhLuan({Key? key, required this.idPhong, required this.idBaiViet})
      : super(key: key);
  final String idPhong, idBaiViet;

  @override
  State<VietBinhLuan> createState() => _VietBinhLuanState();
}

class _VietBinhLuanState extends State<VietBinhLuan> {
  final user = FirebaseAuth.instance.currentUser!;
  var _textController = TextEditingController();

  sendCmt(cmt) {
    if (cmt == '') return;
    FirebaseFirestore.instance
        .collection('departments')
        .doc(widget.idPhong)
        .collection('posts')
        .doc(widget.idBaiViet)
        .collection('comments')
        .add({
      'time': FieldValue.serverTimestamp(),
      'userSend': user.displayName,
      'comment': cmt,
      'image': '',
    }).then((value) {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Nút chọn hình ảnh
          IconButton(
              color: const Color(0xFF08C187),
              icon: const Icon(
                Icons.image,
                size: 35,
              ),
              onPressed: () => {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => Container(
                            height: 150,
                            child: Column(children: [
                              ListTile(
                                leading: const Icon(Icons.camera_alt),
                                title: Text('Camera'),
                                onTap: () {
                                  // Navigator.of(context).pop();
                                  // sendBloc.add(SendImageEvent(
                                  //     widget.chatDocId,
                                  //     widget.friendUid,
                                  //     widget.friendName,
                                  //     ImageSource.camera));
                                },
                              ),
                              ListTile(
                                leading: const Icon(Icons.image),
                                title: Text('Gallery'),
                                onTap: () {
                                  // Navigator.of(context).pop();
                                  // sendBloc.add(SendImageEvent(
                                  //     widget.chatDocId,
                                  //     widget.friendUid,
                                  //     widget.friendName,
                                  //     ImageSource.gallery));
                                },
                              )
                            ])))
                  }),
          // Nhập nội dung tin nhắn
          Expanded(
            child: TextField(
              cursorColor: const Color(0xFF08C187),
              keyboardType: TextInputType.text,
              controller: _textController,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(5),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide:
                        const BorderSide(color: Color(0xFF08C187), width: 3)),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide:
                      const BorderSide(color: Color(0xFF08C187), width: 3),
                ),
                hintText: 'Nhập nội dung ...',
                // labelText: 'Name'
              ),
            ),
          ),
          // Nút gửi tin nhắn
          IconButton(
              color: const Color(0xFF08C187),
              icon: const Icon(
                Icons.send_sharp,
                size: 35,
              ),
              onPressed: () =>
                  {sendCmt(_textController.text), _textController.clear()})
        ],
      ),
    );
  }
}
