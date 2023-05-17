import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x1E1E1E),
      body: Container(
        color: const Color(0x1E1E1E),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(9, 0, 0, 0),
              child: Image.asset(
                'assets/images/logo.jpg',
                height: 75,
                width: 125,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 45),
              child: SizedBox(
                height: 140,
                width: 317,
                child: Text(
                  'Welcome Riders!!!',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 49),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10, left: 47),
              child: SizedBox(
                height: 60,
                width: 298,
                child: Text(
                  'Explore the most premium bicycle services available around you.',
                  style: TextStyle(
                      // fontFamily: 'Jakarta',
                      fontSize: 16,
                      color: Color.fromRGBO(185, 185, 185, 02),
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Image.asset(
              'assets/images/faces.jpg',
              height: 367.35,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25, left: 40, right: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppButton(
                    shapeBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                    child: Text('Login Now',
                        style: boldTextStyle(color: Colors.black)),
                    padding: EdgeInsets.all(16),
                    width: 130,
                    color: Color(0xFFCCFE00),
                    onTap: () {
                      // BMLoginScreen().launch(context);
                    },
                  ),
                  16.width,
                  AppButton(
                    child: Text('Join Now',
                        style: boldTextStyle(color: Colors.white)),
                    width: 130,
                    shapeBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                    padding: EdgeInsets.all(16),
                    color: Colors.grey,
                    onTap: () {
                      // BMRegisterScreen().launch(context);
                    },
                  ),
                ],
              ),
              // child: TextButton(
              //     style: ButtonStyle(
              //         padding: MaterialStateProperty.all<EdgeInsets>(
              //             const EdgeInsets.only(
              //                 top: 25, bottom: 25, left: 105, right: 111)),
              //         backgroundColor: MaterialStateProperty.all<Color>(Colors
              //             .lightGreenAccent.shade200
              //             .withGreen(254)
              //             .withRed(204)
              //             .withBlue(0)),
              //         foregroundColor:
              //             MaterialStateProperty.all<Color>(Colors.black),
              //         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              //             RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(30),
              //         ))),
              //     onPressed: () => Navigator.pushNamed(context, '/signin'),
              //     child: const Text("Get Started",
              //         style: TextStyle(fontSize: 17))),
            ),
          ],
        ),
      ),
    );
  }
}
