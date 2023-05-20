import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/blocs.dart';
import 'screens.dart';

class SigninScreen extends StatefulWidget {
  static var tag = "/SignIn";

  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  bool? rememberMe = false;
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is Authenticated) {
            // Navigating to the dashboard screen if the user is authenticated
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => DashboardScreen()));
          }
          if (state is AuthError) {
            // Showing the error message if the user has entered invalid credentials
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is Loading) {
              // Showing the loading indicator while the user is signing in
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if(state is UnAuthenticated){
              return Center(
                child: SingleChildScrollView(
                  child: Container(
                    alignment: Alignment.center,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: 30),
                          Image.asset("assets/images/logo.png",
                              height: 100, width: 100),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              formHeading("Sign In/"),
                              formSubHeadingForm("Sign Up"),
                            ],
                          ),
                          SizedBox(height: 50),
                          editTextStyle("E-mail",
                              controller: _email,
                              isPassword: false, validator: (value) {
                            return value != null &&
                                    !EmailValidator.validate(value)
                                ? 'Enter a valid email'
                                : null;
                          }),
                          SizedBox(height: 16),
                          editTextStyle("Password",
                              controller: _password,
                              isPassword: true, validator: (value) {
                            return value != null && value.length < 6
                                ? "Enter min. 6 characters"
                                : null;
                          }),
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
                              child: shadowButton("Signin", () {
                                _authenticateWithEmailAndPassword(context);
                              })),
                          SizedBox(height: 24),
                          TextButton(
                            onPressed: (){
                              // Navigator.push(context, MaterialPageRoute(builder: (context)=> PasswordResetScreen()));
                            },
                            child: const Text(
                              "Forgot password",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  void _authenticateWithEmailAndPassword(context) {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context).add(
        SignInRequested(_email.text, _password.text),
      );
    }
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
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
    {isPassword = true,
    TextEditingController? controller,
    String? Function(String?)? validator}) {
  return Padding(
    padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
    child: TextFormField(
      style: TextStyle(fontSize: 20, color: Colors.white),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
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

Widget shadowButton(String name, void Function()? onPressed) {
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
    onPressed: onPressed,
  );
}
