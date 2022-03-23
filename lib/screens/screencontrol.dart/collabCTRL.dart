// ignore_for_file: file_names, camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:test_app_project/screens/home/addcollab.dart';
import 'package:test_app_project/screens/home/return_collab.dart';

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
      return Showcollabs(
        control: collab_screen,
        maincontrol: widget.maincontrol,
      );
    } else {
      return AddCollab(control: collab_screen);
    }
  }
}
