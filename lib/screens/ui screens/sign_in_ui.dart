import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app_project/screens/authentication/register.dart';

import 'package:test_app_project/screens/home/home.dart';

import 'package:test_app_project/services/auth.dart';

class LoginScreen extends StatefulWidget {
  final Function? toggleView;
  LoginScreen({this.toggleView});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final AuthService _auth = AuthService();

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      validator: (value) => value!.isEmpty ? 'Enter an email' : null,
      onChanged: (Value) {
        setState(() {
          email = Value;
        });
      },
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      // validator: (){},
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Enter Your Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    final passwordField = TextFormField(
      validator: (value) =>
          value!.length < 6 ? 'Enter a password 6 char long' : null,
      obscureText: true,
      onChanged: (Value) {
        setState(() {
          password = Value;
        });
      },
      autofocus: false,
      controller: passwordController,
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Enter Your Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 35,
                      child: Text(
                        "TALENTGRAM",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),
                      //child: Image.asset(name
                      //fit:BoxFit.contain),
                    ),
                    SizedBox(height: 45),
                    emailField,
                    SizedBox(height: 35),
                    passwordField,
                    SizedBox(height: 25),
                    Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.purple,
                      child: MaterialButton(
                        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                        minWidth: MediaQuery.of(context).size.width,
                        onPressed: () async {
                          var check =
                              _formkey.currentState?.validate() ?? false;
                          print(check);
                          if (check) {
                            dynamic result = await _auth.signInWithEmailPass(
                                email, password);
                            print(result);
                            if (result == null) {
                              setState(() {
                                error =
                                    'could not sign in with these credentials';
                              });
                            }
                          }
                        },
                        child: Text(
                          "Login",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?"),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Register()));
                          },
                          child: TextButton(
                            child: Text(
                              "register",
                              style: TextStyle(
                                  color: Colors.purple,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15),
                            ),
                            onPressed: () {
                              widget.toggleView!();
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Forgot Your Password?"),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Reset Password",
                            style: TextStyle(
                                color: Colors.purple,
                                fontWeight: FontWeight.w400,
                                fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
