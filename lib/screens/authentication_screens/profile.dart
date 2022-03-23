// ignore_for_file: must_call_super

import 'package:flutter/material.dart';

import 'package:test_app_project/services/auth.dart';

class Profile extends StatefulWidget {
  final String upassword;
  final String uemail;
  const Profile({Key? key, required this.uemail, required this.upassword})
      : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _formkey = GlobalKey<FormState>();
  final firstNameEditingController = TextEditingController();
  final secondNameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final confirmPasswordEditingController = TextEditingController();
  final AuthService _auth = AuthService();

  String name = '';
  String username = '';
  String error = '';
  String password = '';
  String email = '';
  @override
  void initState() {
    password = widget.upassword;
    email = widget.uemail;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.purple),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: Colors.white,
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
                          value!.isEmpty ? 'Enter your name' : null,
                      onChanged: (value) {
                        setState(() {
                          name = value;
                        });
                      },
                      autofocus: false,

                      keyboardType: TextInputType.name,
                      // validator: (){},
                      onSaved: (value) {
                        emailEditingController.text = value!;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.mail),
                        contentPadding:
                            const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        hintText: "name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    TextFormField(
                      validator: (value) => value!.length < 6
                          ? 'Enter a username 6 char long'
                          : null,

                      onChanged: (value) {
                        setState(() {
                          username = value;
                        });
                      },
                      autofocus: false,
                      controller: passwordEditingController,

                      // validator: (){},
                      onSaved: (value) {
                        passwordEditingController.text = value!;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.vpn_key),
                        contentPadding:
                            const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        hintText: "Enter Your Username",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.purple,
                      child: MaterialButton(
                        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        minWidth: MediaQuery.of(context).size.width,
                        onPressed: () async {
                          if (_formkey.currentState?.validate() ?? false) {
                            dynamic result = await _auth.regWithEmailPass(
                                email, password, name, username);
                            if (result == null) {
                              setState(() {
                                error = 'supply valid email_id';
                              });
                            }
                          }
                        },
                        child: const Text(
                          "Sign Up",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Text(error)
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
