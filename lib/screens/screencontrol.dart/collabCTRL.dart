import 'package:flutter/material.dart';
import 'package:test_app_project/screens/home/addcollab.dart';
import 'package:test_app_project/screens/home/showcollab.dart';

class control extends StatefulWidget {
  final Function? maincontrol;
  const control({Key? key, this.maincontrol}) : super(key: key);

  @override
  State<control> createState() => _controlState();
}

class _controlState extends State<control> {
  bool controller = true;
  void collab_screen() {
    setState(() {
      controller = !controller;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller) {
      return Home(
        control: collab_screen,
        maincontrol: widget.maincontrol,
      );
    } else {
      return AddCollab(control: collab_screen);
    }
  }
}
