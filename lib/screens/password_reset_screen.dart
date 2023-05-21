import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mycycleclinic/screens/screens.dart';
import 'package:nb_utils/nb_utils.dart';

import '../blocs/blocs.dart';

class PasswordResetScreen extends StatefulWidget {
  const PasswordResetScreen({super.key});

  @override
  State<PasswordResetScreen> createState() => _PasswordResetScreenState();
}

final _formKey = GlobalKey<FormState>();

class _PasswordResetScreenState extends State<PasswordResetScreen> {
  final TextEditingController _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is PasswordResetFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errorMessage)));

          }
          if (state is PasswordResetSuccess) {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => SigninScreen()),
              (route) => false,
            );
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Password reset email sent')));
          }
        },
        builder: (context, state) {
          if (state is PasswordResetLoading) {
            // Showing the loading indicator while the user is signing in
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is UnAuthenticated ||
              state is PasswordResetFailure ||
              state is PasswordResetSuccess) {
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
                          children: <Widget>[formHeading("Forgot Password")],
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
                        SizedBox(height: 8),
                        Padding(
                            padding: EdgeInsets.fromLTRB(40, 16, 40, 16),
                            child: shadowButton("Reset Password", () {
                              String email = _email.text.trim();
                              if (email.isNotEmpty) {
                                context
                                    .read<AuthBloc>()
                                    .add(ResetPassword(email));
                              }
                            })),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          return Container(
            child: Text("Password reset"),
          );
        },
      ),
    );
  }
}