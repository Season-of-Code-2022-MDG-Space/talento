import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app_project/models/user.dart';
import 'package:test_app_project/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:test_app_project/services/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserDetails?>.value(
      initialData: null,
      value: AuthService().userc,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
