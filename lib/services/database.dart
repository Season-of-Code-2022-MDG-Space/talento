import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseService {
  String? uid;
  DataBaseService({this.uid});

  final CollectionReference userdata =
      FirebaseFirestore.instance.collection('users');

  Future updateUserData() async {
    return await userdata.doc(uid).set({"uid": uid});
  }
}
