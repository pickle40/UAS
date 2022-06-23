import 'dart:developer';

import 'package:c14190003_01/dataClass/dcPost.dart';
import 'package:c14190003_01/pages/liked.dart';
import 'package:c14190003_01/services/apiServices.dart';
import 'package:c14190003_01/services/dbServices.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Service serviceAPI = Service();
  //variable future untuk mengambil data dari json
  late Future<List<cPost>> listData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listData = serviceAPI.getAllData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: FutureBuilder<List<cPost>>(
                future: listData,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<cPost> isiData = snapshot.data!;
                    return ListView.builder(
                      itemCount: isiData.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Text(isiData[index].ctitle),
                            leading: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(isiData[index].cthumbnail),
                            ),
                            subtitle: Text(isiData[index].cpubDate),
                            onTap: () {
                              //showData(isiData[index].cid);
                            },
                            onLongPress: () {
                              //untuk add data ke like
                            },
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => liked()));
                  },
                  backgroundColor: Colors.green,
                  child: const Icon(Icons.add),
                ),
                FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: Colors.green,
                  child: const Icon(Icons.book),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
