// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';

import 'package:test_app_project/services/auth.dart';

class LoginScreen extends StatefulWidget {
  final Function? toggleView;
  const LoginScreen({Key? key, this.toggleView}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
        prefixIcon: const Icon(Icons.mail),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
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
        prefixIcon: const Icon(Icons.vpn_key),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
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
                    const SizedBox(
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
                    const SizedBox(height: 45),
                    emailField,
                    const SizedBox(height: 35),
                    passwordField,
                    const SizedBox(height: 25),
                    Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.purple,
                      child: MaterialButton(
                        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
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
                        child: const Text(
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
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?"),
                        TextButton(
                          child: const Text(
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
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Forgot Your Password?"),
                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            "Reset Password",
                            style: TextStyle(
                                color: Colors.purple,
                                fontWeight: FontWeight.w400,
                                fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                    Text(error)
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
