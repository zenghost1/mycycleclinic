import 'package:flutter/material.dart';

class SigninScreen extends StatefulWidget {
  static var tag = "/SignIn";

  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  bool? rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 30),
                Image.asset("assets/images/logo.png", height: 100, width: 100),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    formHeading("Sign In/"),
                    formSubHeadingForm("Sign Up"),
                  ],
                ),
                SizedBox(height: 50),
                editTextStyle("E-mail", isPassword: false),
                SizedBox(height: 16),
                editTextStyle("Password", isPassword: true),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                  child: CheckboxListTile(
                    activeColor: Colors.white,
                    selectedTileColor: Colors.white,
                    checkColor: Colors.black,
                    title: const Text(
                      "Remember Me",
                      style: TextStyle(color: Colors.white),
                    ),
                    value: rememberMe,
                    onChanged: (newValue) {
                      rememberMe = newValue;
                      setState(() {});
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                    padding: EdgeInsets.fromLTRB(40, 16, 40, 16),
                    child: shadowButton("Signin")),
                SizedBox(height: 24),
                const InkWell(
                  child: Text(
                    "Forgot password",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Text formHeading(var label) {
  return Text(label,
      style:
          TextStyle(color: Color(0xFFCCFE00), fontSize: 30, fontFamily: 'Bold'),
      textAlign: TextAlign.center);
}

Text formSubHeadingForm(var label) {
  return Text(label,
      style: TextStyle(color: Colors.grey, fontSize: 20, fontFamily: 'Bold'),
      textAlign: TextAlign.center);
}

Padding editTextStyle(var hintText,
    {isPassword = true, TextEditingController? controller}) {
  return Padding(
    padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
    child: TextFormField(
      style: TextStyle(fontSize: 20, color: Colors.white),
      obscureText: isPassword,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(24, 18, 24, 18),
        hintText: hintText,
        filled: true,
        fillColor: Color(0xFF1C1F26),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: const BorderSide(color: Color(0XFFE8E8E8), width: 0.0)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(color: Color(0XFFE8E8E8), width: 0.0),
        ),
      ),
    ),
  );
}

Widget shadowButton(String name) {
  return MaterialButton(
    height: 60,
    minWidth: double.infinity,
    child: Text(
      name,
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    textColor: Colors.black,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
    color: Color(0xFFCCFE00),
    onPressed: () => {},
  );
}
