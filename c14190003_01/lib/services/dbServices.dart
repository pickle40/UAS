import 'package:c14190003_01/dataClass/dcPost.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference tblLikedPosts =
    FirebaseFirestore.instance.collection("LikedPosts");

class DatabaseLikedPost {
  static Stream<QuerySnapshot> getAllData() {
    return tblLikedPosts.snapshots();
  }

  static Stream<QuerySnapshot> filterTitle({required String title}) {
    if (title == "") {
      return tblLikedPosts.snapshots();
    } else {
      return tblLikedPosts.where('title', isEqualTo: title).snapshots();
    }
  }

  static Future<void> addLikeData({required cPost post}) async {
    DocumentReference docref = tblLikedPosts.doc(post.ctitle);

    await docref
        .set(post.toJson())
        .whenComplete(() => print("Data Berhasil diinput"))
        .catchError((e) => print(e));
  }
}
