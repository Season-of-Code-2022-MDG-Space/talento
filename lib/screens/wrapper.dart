import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app_project/models/user.dart';
import 'package:test_app_project/screens/authentication/authenticate.dart';
import 'package:test_app_project/screens/screencontrol.dart/homeCTRL.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserDetails?>(context);

    //return  either home or authenticate
    if (user == null) {
      return const Authenticate();
    } else {
      return const maincontrol();
    }
  }
}
