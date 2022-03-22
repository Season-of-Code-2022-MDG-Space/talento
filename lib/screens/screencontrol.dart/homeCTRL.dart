import 'package:flutter/material.dart';
import 'package:test_app_project/screens/screencontrol.dart/collabCTRL.dart';
import 'package:test_app_project/screens/screencontrol.dart/imageCTRL.dart';

class maincontrol extends StatefulWidget {
  const maincontrol({Key? key}) : super(key: key);

  @override
  State<maincontrol> createState() => _maincontrolState();
}

class _maincontrolState extends State<maincontrol> {
  bool controller = true;

  void mcontrol() {
    setState(() {
      controller = !controller;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller) {
      return imagecontrol(
        maincontrol: mcontrol,
      );
    } else {
      return control(
        maincontrol: mcontrol,
      );
    }
  }
}
