import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference tblLikedPosts =
    FirebaseFirestore.instance.collection("LikedPosts");

class DatabaseLikedPost {
  static Stream<QuerySnapshot> getAllData() {
    return tblLikedPosts.snapshots();
  }

  static Stream<QuerySnapshot> filterTitle({required String title}) {
    return tblLikedPosts.where('title', isEqualTo: title).snapshots();
  }
}
