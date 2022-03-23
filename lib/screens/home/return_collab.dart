// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test_app_project/services/auth.dart';

class Showcollabs extends StatefulWidget {
  String? userId;
  final Function? control;
  final Function? maincontrol;
  Showcollabs({Key? key, this.control, this.maincontrol}) : super(key: key);

  @override
  _ShowcollabsState createState() => _ShowcollabsState();
}

class _ShowcollabsState extends State<Showcollabs> {
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
                  widget.control!();
                },
                icon: const Icon(Icons.add_a_photo_outlined))
          ],
        ),
        body: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection("collabs").snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return (const Center(child: Text("No image uploaded")));
              } else {
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      String url = snapshot.data!.docs[index]['description'];
                      return Container(
                          margin:
                              const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          padding: const EdgeInsets.all(20.0),
                          color: Colors.grey,
                          child: Text(url));
                    });
              }
            }),
        bottomNavigationBar:
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Container(
              color: Colors.white,
              child: IconButton(
                  onPressed: () {
                    widget.maincontrol!();
                  },
                  icon: const Icon(Icons.image_outlined))),
          Container(color: Colors.blue, child: const Icon(Icons.message))
        ]));
  }
}
