import 'package:app_tin_tuc_cao_thang/home/settings/information.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BinhLuan extends StatefulWidget {
  const BinhLuan({Key? key, required this.idBaiViet}) : super(key: key);
  final String idBaiViet;
  @override
  State<BinhLuan> createState() => _BinhLuanState();
}

class _BinhLuanState extends State<BinhLuan> {
  @override
  void initState() {
    super.initState();
  }

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
                      onPressed: () {})),
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
      body: Padding(
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
            ChiTietBinhLuan(
              idBaiViet: widget.idBaiViet,
            ),
            VietBinhLuan(
              idBaiViet: widget.idBaiViet,
            )
          ],
        ),
      ),
    );
  }
}

class ChiTietBinhLuan extends StatefulWidget {
  const ChiTietBinhLuan({Key? key, required this.idBaiViet}) : super(key: key);
  final String idBaiViet;
  @override
  State<ChiTietBinhLuan> createState() => _ChiTietBinhLuanState();
}

class _ChiTietBinhLuanState extends State<ChiTietBinhLuan> {
  final Stream<QuerySnapshot> posts =
      FirebaseFirestore.instance.collection('posts').snapshots();

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> commets = FirebaseFirestore.instance
        .collection('posts')
        .doc(widget.idBaiViet)
        .collection('comments')
        .orderBy('time', descending: false)
        .snapshots();

    return Expanded(
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
                      onTap: () {},
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
  const VietBinhLuan({Key? key, required this.idBaiViet}) : super(key: key);
  final String idBaiViet;

  @override
  State<VietBinhLuan> createState() => _VietBinhLuanState();
}

class _VietBinhLuanState extends State<VietBinhLuan> {
  final user = FirebaseAuth.instance.currentUser!;
  var _textController = TextEditingController();

  sendCmt(cmt) {
    if (cmt == '') return;
    FirebaseFirestore.instance
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
          Expanded(
            child: TextField(
              cursorColor: Colors.blueAccent,
              keyboardType: TextInputType.text,
              controller: _textController,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(5),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide:
                        const BorderSide(color: Colors.blueAccent, width: 3)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide:
                      const BorderSide(color: Colors.blueAccent, width: 3),
                ),
                hintText: 'Nhập nội dung ...',
              ),
            ),
          ),
          IconButton(
              color: Colors.blueAccent,
              icon: const Icon(
                Icons.send_sharp,
                size: 35,
              ),
              onPressed: () => {
                    if (_textController.text.length < 5)
                      {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  content: const Text('Nhập ít nhất 5 ký tự'),
                                  actions: [
                                    FlatButton(
                                        child: const Text('OK'),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        }),
                                  ],
                                ))
                      }
                    else
                      {sendCmt(_textController.text), _textController.clear()}
                  })
        ],
      ),
    );
  }
}
