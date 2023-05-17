import 'package:flutter/material.dart';
import 'screens.dart';

class SignupScreen extends StatelessWidget {
  static var tag = "/SignUp";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 30),
                Image.asset("assets/images/logo.png", height: 100, width: 100),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    formHeading("Sign Up/"),
                    formSubHeadingForm("Sign in"),
                  ],
                ),
                SizedBox(height: 40),
                editTextStyle("Full Name", isPassword: false),
                SizedBox(height: 16),
                editTextStyle("Mobile number", isPassword: false),
                SizedBox(height: 16),
                editTextStyle("Enter password", isPassword: true),
                SizedBox(height: 16),
                editTextStyle("Enter password again", isPassword: true),
                SizedBox(height: 20),
                Padding(
                    padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                    child: shadowButton("Sign UP")),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Already have an account?",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Sign in",
                      style: TextStyle(
                        color: Color(0xFFCCFE00),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


