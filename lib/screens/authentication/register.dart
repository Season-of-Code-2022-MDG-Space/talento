import 'package:flutter/material.dart';
import 'package:test_app_project/screens/authentication/sign_in.dart';
import 'package:test_app_project/services/auth.dart';

class Register extends StatefulWidget {
  final Function? toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
        title: Text("Register on talentgram"),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formKey,
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
                    child: Text("Register"),
                    onPressed: () async {
                      if (_formKey.currentState?.validate() ?? false) {
                        dynamic result =
                            await _auth.regWithEmailPass(email, password);
                        if (result == null) {
                          setState(() {
                            error = 'supply valid email_id';
                          });
                        }
                      }
                    }),
                SizedBox(
                  height: 10.0,
                ),
                RaisedButton(
                    color: Colors.pink,
                    child: Text("sign in"),
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
