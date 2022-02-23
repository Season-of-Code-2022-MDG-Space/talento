import 'package:flutter/material.dart';
import 'package:test_app_project/screens/authentication/authenticate.dart';
import 'package:test_app_project/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    //return  either home or authenticate
    return Authenticate();
  }
}
