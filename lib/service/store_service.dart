import 'package:flutter_chat_app/const/firebase_const.dart';

class StoreServices {
  static getUser(String id) {
    return firebaseFirestore
        .collection(collectionUser)
        .where('id', isEqualTo: id)
        .get();
  }
}
