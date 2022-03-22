import 'package:flutter/material.dart';
import 'package:test_app_project/services/auth.dart';

class Home extends StatefulWidget {
  final Function? control;
  final Function? maincontrol;
  Home({Key? key, this.control, this.maincontrol}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                icon: Icon(
                  Icons.add_circle_outline,
                  color: Colors.black,
                ))
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
              children: [Text("username"), Text("name"), Text("description")]),
        ),
        bottomNavigationBar:
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Container(
              color: Colors.white,
              child: IconButton(
                  onPressed: () {
                    widget.maincontrol!();
                  },
                  icon: Icon(Icons.image_outlined))),
          Container(color: Colors.blue, child: Icon(Icons.message))
        ]));
  }
}
