import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

//The following is for the app router file routing config
// We first declare a string of routename for ErrorScreen class
  static const String routeName = '/error';
// A route method which returns a abstract class Route
  static Route errorroute() {
    return MaterialPageRoute(
        builder: (_) => const ErrorScreen(),
        settings: const RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/no_signal.jpg',
              scale: 1.7,
            ),
            const Text(
              'No Internet Connection',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 25),
            ),
            SizedBox(
              height: 18,
            ),
            const Text(
              'Your internet connection is currently ',
              style: TextStyle(
                  fontFamily: 'Jakarta',
                  fontSize: 17,
                  color: Color.fromRGBO(0, 0, 0, 0.5),
                  fontWeight: FontWeight.normal),
            ),
            const Text(
              ' not available please check or try again.',
              style: TextStyle(
                  // fontFamily: 'Jakarta',
                  fontSize: 17,
                  color: Color.fromRGBO(0, 0, 0, 0.5),
                  fontWeight: FontWeight.normal),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 65, left: 40, right: 40),
                child: TextButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.only(
                                top: 15, bottom: 25, left: 105, right: 111)),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFFCCFE00)),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ))),
                    onPressed: () {},
                    child: const Text("Try Again",
                        style: TextStyle(fontSize: 17))))
          ],
        ),
      ),
    );
  }
}
