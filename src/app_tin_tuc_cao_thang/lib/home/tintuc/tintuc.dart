import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';

class TinTuc extends StatefulWidget {
  const TinTuc({Key? key}) : super(key: key);

  @override
  State<TinTuc> createState() => _TinTucState();
}

class _TinTucState extends State<TinTuc> {
  @override
  Widget build(BuildContext context) {
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
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.circle, size: 45)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    'Tin tức',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent),
                  ),
                ),
                Tin(),
                Trang()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Tin extends StatefulWidget {
  const Tin({Key? key}) : super(key: key);

  @override
  State<Tin> createState() => _TinState();
}

class _TinState extends State<Tin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(5),
      ),
      height: 600,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return const Card(
                child: ListTile(
                  title: Text('Tiêu đề bài viết'),
                  subtitle: Text('Nội dung bài viết'),
                ),
              );
            }),
      ),
    );
  }
}

class Trang extends StatefulWidget {
  const Trang({Key? key}) : super(key: key);

  @override
  State<Trang> createState() => _TrangState();
}

class _TrangState extends State<Trang> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        // decoration: BoxDecoration(
        //   border: Border.all(color: Colors.grey, width: 2),
        //   borderRadius: BorderRadius.circular(5),
        // ),
        child: NumberPaginator(
          height: 40,
          numberPages: 10,
          buttonShape: BeveledRectangleBorder(),
          buttonUnselectedForegroundColor: Colors.blueAccent,
          buttonSelectedBackgroundColor: Colors.blueAccent,
          onPageChange: (int index) {
            setState(() {});
          },
        ),
      ),
    );
  }
}
