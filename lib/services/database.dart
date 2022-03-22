import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseService {
  String? uid;

  DataBaseService({this.uid});

  final CollectionReference collabdata =
      FirebaseFirestore.instance.collection("collabs");

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

  Future createCollab(String? uid, String desc) async {
    // ignore: avoid_single_cascade_in_expression_statements
    List profiledata = [];
    String name = '';
    String username = '';
    var temp = await userdata.doc(uid).get();
    name = temp["name"];
    username = temp["username"];

    return await collabdata.doc(uid).set(
        {"description": desc, "name": name, "username": username},
        SetOptions(merge: true));
  }
}
