import 'package:flutter/material.dart';
import 'package:test_app_project/screens/authentication/register.dart';
import 'package:test_app_project/services/auth.dart';

class SignIn extends StatefulWidget {
  final Function? toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text("sign into talentgram"),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            child: Column(
              children: [
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(onChanged: (Value) {
                  setState(() {
                    email = Value;
                  });
                }),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                    obscureText: true,
                    onChanged: (Value) {
                      setState(() {
                        password = Value;
                      });
                    }),
                RaisedButton(
                    color: Colors.pink,
                    child: Text("sign in"),
                    onPressed: () async {
                      print(email);
                      print(password);
                    }),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                    color: Colors.pink,
                    child: Text("Register"),
                    onPressed: () {
                      widget.toggleView!();
                    })
              ],
            ),
          )),
    );
  }
}
