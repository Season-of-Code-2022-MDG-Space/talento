// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:test_app_project/screens/authentication/profilemaker.dart';

import 'package:test_app_project/screens/authentication_screens/sign_in_ui.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  bool profilemaker = false;
  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  void whereto() {
    setState(() {
      profilemaker = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn == true) {
      return LoginScreen(
        toggleView: toggleView,
      );
    } else {
      return RegSatge(
        toggleView: toggleView,
      );
    }
  }
}
