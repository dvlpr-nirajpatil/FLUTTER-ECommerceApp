import 'package:e_commerce_app/consts/consts.dart';

class FirestoreServices {
  static getUser(uid) {
    return firestore
        .collection(userCollections)
        .where('id', isEqualTo: uid)
        .snapshots();
  }
}
