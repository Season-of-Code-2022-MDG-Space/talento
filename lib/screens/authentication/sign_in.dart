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
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';
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
                  height: 10.0,
                ),
                TextFormField(
                    validator: (value) =>
                        value!.isEmpty ? 'Enter an email' : null,
                    onChanged: (Value) {
                      setState(() {
                        email = Value;
                      });
                    }),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                    validator: (value) => value!.length < 6
                        ? 'Enter a password 6 char long'
                        : null,
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
                      var check = _formKey.currentState?.validate();
                      if (check == null) {
                        dynamic result =
                            await _auth.signInWithEmailPass(email, password);
                        if (result == null) {
                          setState(() {
                            error = 'could not sign in with these credentials';
                          });
                        }
                      }
                    }),
                SizedBox(
                  height: 10.0,
                ),
                RaisedButton(
                    color: Colors.pink,
                    child: Text("Register"),
                    onPressed: () {
                      widget.toggleView!();
                    }),
                SizedBox(
                  height: 10.0,
                ),
                Text(error)
              ],
            ),
          )),
    );
  }
}
