import 'package:flutter/material.dart';
import 'package:test_app_project/services/auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text("sign into talentgram"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: ElevatedButton(
          onPressed: () async {
            dynamic authresult = await _auth.signInAnon();
            if (authresult == null) {
              print("not signed in");
            } else {
              print("signed in");
              print(authresult.uid);
            }
          },
          child: Text("Sign in as anon"),
        ),
      ),
    );
  }
}
