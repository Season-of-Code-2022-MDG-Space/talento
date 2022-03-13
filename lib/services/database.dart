import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseService {
  String? uid;

  DataBaseService({this.uid});

  final CollectionReference userdata =
      FirebaseFirestore.instance.collection('users');

  Future updateUserData(String email) async {
    return await userdata.doc(uid).set({"uid": uid, "email": email});
  }

  Future updateUserProfile(String name, String username) async {
    return await userdata.doc(uid).set(
      {"name": name, "username": username},
      SetOptions(merge: true),
    );
  }
}
