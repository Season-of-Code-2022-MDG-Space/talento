import 'package:flutter/material.dart';
import 'package:test_app_project/screens/authentication_screens/profile.dart';
import 'package:test_app_project/screens/authentication_screens/register_ui.dart';

class RegSatge extends StatefulWidget {
  final Function? toggleView;

  // ignore: use_key_in_widget_constructors
  const RegSatge({this.toggleView});

  @override
  State<RegSatge> createState() => _RegSatgeState();
}

class _RegSatgeState extends State<RegSatge> {
  bool profilemaker = false;
  String pemail = '';
  String ppassword = '';
  void whereto() {
    setState(() {
      profilemaker = true;
    });
  }

  void setvalues(String setemail, String setpassword) {
    setState(() {
      pemail = setemail;
      ppassword = setpassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (profilemaker == false) {
      return RegisterationScreen(
        toggleView: widget.toggleView,
        whereto: whereto,
        setvalues: setvalues,
      );
    } else {
      return Profile(uemail: pemail, upassword: ppassword);
    }
  }
}
