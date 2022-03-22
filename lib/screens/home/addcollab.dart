import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:test_app_project/models/user.dart';
import 'package:test_app_project/services/database.dart';

class AddCollab extends StatefulWidget {
  final Function? control;
  const AddCollab({Key? key, this.control}) : super(key: key);

  @override
  State<AddCollab> createState() => _AddCollabState();
}

class _AddCollabState extends State<AddCollab> {
  final _formkey = GlobalKey<FormState>();
  String collabdesc = '';

  String? currentuid = FirebaseAuth.instance.currentUser?.uid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Talentgram"),
        actions: [
          TextButton(
              onPressed: () {
                widget.control!();
              },
              child: Text(
                "back",
                style: TextStyle(color: Colors.black),
              ))
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 35,
                      child: Text(
                        "TALENTGRAM",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),
                      //child: Image.asset(name
                      //fit:BoxFit.contain),
                    ),
                    const SizedBox(height: 25),
                    const SizedBox(height: 25),
                    TextFormField(
                      validator: (value) =>
                          value!.isEmpty ? 'Enter collab description' : null,
                      onChanged: (value) {
                        setState(() {
                          collabdesc = value;
                        });
                      },
                      autofocus: false,

                      keyboardType: TextInputType.text,
                      // validator: (){},

                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.mail),
                        contentPadding:
                            const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        hintText: "collab description",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    TextButton(
                        onPressed: () async {
                          await DataBaseService(uid: currentuid)
                              .createCollab(currentuid, collabdesc);
                          widget.control!();
                        },
                        child: Text("add collab"))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
