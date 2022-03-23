// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test_app_project/services/auth.dart';

class ShowUploads extends StatefulWidget {
  String? userId;
  final Function? imagecontrol;
  final Function? maincontrol;
  ShowUploads({Key? key, this.imagecontrol, this.maincontrol})
      : super(key: key);

  @override
  _ShowUploadsState createState() => _ShowUploadsState();
}

class _ShowUploadsState extends State<ShowUploads> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Talentgram"),
        actions: [
          TextButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: const Icon(
                Icons.person,
                color: Colors.black,
              ),
              label: const Text(
                "log out",
                style: TextStyle(color: Colors.black),
              )),
          IconButton(
              onPressed: () {
                widget.imagecontrol!();
              },
              icon: const Icon(Icons.add_a_photo_outlined))
        ],
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("users")
              .doc("uid")
              .collection("images")
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return (const Center(child: Text("No image uploaded")));
            } else {
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    String url = snapshot.data!.docs[index]['downloadURL'];
                    return Container(
                      margin: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      padding: const EdgeInsets.all(20.0),
                      color: Colors.grey,
                      child: Image.network(
                        url,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                    );
                  });
            }
          }),
      bottomNavigationBar:
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Container(color: Colors.blue, child: const Icon(Icons.image)),
        Container(
            color: Colors.white,
            child: IconButton(
              icon: const Icon(Icons.message),
              onPressed: () {
                widget.maincontrol!();
              },
            ))
      ]),
    );
  }
}