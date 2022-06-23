import 'package:c14190003_01/dataClass/dcPost.dart';
import 'package:c14190003_01/main.dart';
import 'package:c14190003_01/services/dbServices.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

class details extends StatefulWidget {
  final cPost Post;
  const details({Key? key, required this.Post}) : super(key: key);

  @override
  State<details> createState() => _detailsState();
}

class _detailsState extends State<details> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Details"),
        ),
        body: Column(children: [
          Text(widget.Post.ctitle),
          Text(widget.Post.cpubDate),
          Image.network(widget.Post.cthumbnail),
          Text(widget.Post.clink),
          Text(widget.Post.cdescription),
          // ElevatedButton(
          //   onPressed: () {
          //     Navigator.pop((context) => main());
          //   },
          //   child: Text("Back"),
          // ),
        ]),
      ),
    );
  }
}
