// ignore_for_file: file_names, camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:test_app_project/screens/home/image_upload.dart';
import 'package:test_app_project/screens/home/show_images.dart';

class imagecontrol extends StatefulWidget {
  final Function? maincontrol;
  const imagecontrol({Key? key, this.maincontrol}) : super(key: key);

  @override
  State<imagecontrol> createState() => _imagecontrolState();
}

class _imagecontrolState extends State<imagecontrol> {
  bool icontroller = true;

  void image_screen() {
    setState(() {
      icontroller = !icontroller;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (icontroller) {
      return ShowUploads(
        imagecontrol: image_screen,
        maincontrol: widget.maincontrol,
      );
    } else {
      return ImageUpload(
        imagecontrol: image_screen,
      );
    }
  }
}
