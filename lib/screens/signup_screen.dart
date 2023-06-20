import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/blocs.dart';
import 'screens.dart';

class SignupScreen extends StatefulWidget {
  static var tag = "/SignUp";

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _mobile = TextEditingController();
  final _password = TextEditingController();
  final _confirmpassword = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _mobile.dispose();
    _confirmpassword.dispose();
    super.dispose();
  }

  void _createAccountWithEmailAndPassword(BuildContext context) {
    //if (_formKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context).add(
        SignUpRequested(
          _email.text,
          _password.text,
        ),
      );
    }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            // Navigating to the dashboard screen if the user is authenticated
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => DashboardScreen(),
              ),
            );
          }
          if (state is AuthError) {
            // Displaying the error message if the user is not authenticated
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        builder: (context, state) {
          if (state is Loading) {
            // Displaying the loading indicator while the user is signing up
            return const Center(child: CircularProgressIndicator());
          }
          if (state is UnAuthenticated) {
            // Displaying the sign up form if the user is not authenticated
            return Center(
              child: Container(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(height: 30),
                      Image.asset("assets/images/logo.png",
                          height: 100, width: 100),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          formHeading("Sign Up/"),
                          formSubHeadingForm("Sign in"),
                        ],
                      ),
                      const SizedBox(height: 40),
                      editTextStyle(
                        "Full Name",
                        isPassword: false,
                        controller: _email,
                        validator: (value) {
                          return value != null &&
                                  !EmailValidator.validate(value)
                              ? 'Enter a valid email'
                              : null;
                        },
                      ),
                      const SizedBox(height: 16),
                      editTextStyle("Mobile number",
                          isPassword: false, controller: _mobile),
                      const SizedBox(height: 16),
                      editTextStyle(
                        "Enter password",
                        isPassword: true,
                        controller: _password,
                        validator: (value) {
                          return value != null && value.length < 6
                              ? "Enter min. 6 characters"
                              : null;
                        },
                      ),
                      const SizedBox(height: 16),
                      editTextStyle(
                        "Enter password again",
                        isPassword: true,
                        controller: _confirmpassword,
                        validator: (value) {
                          return value != null && value.length < 6
                              ? "Enter min. 6 characters"
                              : null;
                        },
                      ),
                      const SizedBox(height: 20),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                          child: shadowButton("Sign UP", () {
                            _createAccountWithEmailAndPassword(context);
                          })),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            "Already have an account?",
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(width: 8),
                          TextButton(
                            child: const Text(
                              "Sign in",
                              style: TextStyle(
                                color: Color(0xFFCCFE00),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SigninScreen()));
                            },
                          )
                        ],
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
