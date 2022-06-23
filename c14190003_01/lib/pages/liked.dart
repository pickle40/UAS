import 'package:c14190003_01/services/dbServices.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

class liked extends StatefulWidget {
  const liked({ Key? key }) : super(key: key);

  @override
  State<liked> createState() => _likedState();
}

class _likedState extends State<liked> {
  String input = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Liked Post"),
        ),
        body: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              TextField(
                onChanged: (value) {
                  setState(() {
                    input = value;
                  });
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.lightBlue),
                  ),
                ),
              ),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: DatabaseLikedPost.filterTitle(title: input),
                  builder: (context, snapshot) {
                    if (snapshot.hasData || snapshot.data != null) {
                      return ListView.separated(
                        separatorBuilder: (context, index) => SizedBox(
                          height: 8,
                        ),
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot likedData = snapshot.data!.docs[index];
                          String title = likedData['title'];
                          String pubDate = likedData['pubDate'];
                          String link = likedData['link'];
                          return ListTile(
                            onLongPress: () {},
                            title: Text(title),
                            subtitle: Text(link),
                          );
                        },
                      );
                    } else {
                      return Text("Error");
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}