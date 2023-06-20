import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../screens/screens.dart';
import '../blocs/blocs.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

//The following is for the app router file routing config
// We first declare a string of routename for LocationScreen class
  static const String routeName = '/profile';
// A route method which returns a abstract class Route
  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const ProfileScreen(),
        settings: const RouteSettings(name: routeName));
  }

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              context.read<AuthBloc>().add(SignOutRequested());
            },
            icon: const Icon(
              Icons.exit_to_app_outlined,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is UnAuthenticated) {
            // Navigate to the sign in screen when the user Signs Out
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => LandingScreen()),
              (route) => false,
            );
          }
        },
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 15),
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Image.asset(
                  "assets/images/profileimage.png",
                  scale: 1.5,
                ),
                // Container(
                //   width: 200,
                //   height: 200,
                //   decoration: const BoxDecoration(
                //     color: Colors.white,
                //     shape: BoxShape.circle,
                //     image: DecorationImage(
                //         image: AssetImage("assets/images/profileimage.png"),
                //         fit: BoxFit.contain),
                //   ),
                // ),
                const Text(
                  // "${FirebaseAuth.instance.currentUser!.displayName}"
                  'RidingLion86',
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.black,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 7),
                  child: Text(
                    // "${FirebaseAuth.instance.currentUser!.email}",
                    "Laughing ghost",
                    style: TextStyle(
                        color: Color(0xFF797979),
                        fontWeight: FontWeight.w500,
                        fontSize: 12),
                  ),
                ),

                Container(
                  height: 90,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Your Cart',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 16),
                          ),
                          Text(
                            'Wish to Checkout?',
                            style: TextStyle(
                                color: Color(0xFF797979),
                                fontWeight: FontWeight.w500,
                                fontSize: 12),
                          )
                        ],
                      ),
                      const Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: const EdgeInsets.only(top: 8),
                  height: 168,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Your orders',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 16),
                          ),
                          const Text(
                            'Latest Order',
                            style: TextStyle(
                                color: Color(0xFF797979),
                                fontWeight: FontWeight.w500,
                                fontSize: 12),
                          ),
                          Image.asset(
                            'assets/images/order.png',
                            scale: 1.5,
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Text(
                            'FireFox GT 180R',
                            style: TextStyle(
                              color: Color(0xFF9ABF00),
                              fontWeight: FontWeight.w900,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'Cleaning',
                            style: TextStyle(
                                color: Color(0xFF797979),
                                fontWeight: FontWeight.w500,
                                fontSize: 10),
                          ),
                          Text(
                            'Brake Repair',
                            style: TextStyle(
                                color: Color(0xFF797979),
                                fontWeight: FontWeight.w500,
                                fontSize: 10),
                          ),
                          Text(
                            'Tire Change',
                            style: TextStyle(
                                color: Color(0xFF797979),
                                fontWeight: FontWeight.w500,
                                fontSize: 10),
                          ),
                        ],
                      )
                    ],
                  ),
                ),

                Container(
                  margin: const EdgeInsets.only(top: 8),
                  height: 100,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Current Order Status',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 16),
                          ),
                          Text(
                            'NO ORDER',
                            style: TextStyle(
                                color: Color(0xFF9ABF00),
                                fontWeight: FontWeight.w900,
                                fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Padding(
                //   padding: const EdgeInsets.only(top: 10),
                //   child: Container(
                //     decoration: const BoxDecoration(
                //       color: Colors.black,
                //       borderRadius: BorderRadius.all(Radius.circular(15)),
                //     ),
                //     height: 75,
                //     width: MediaQuery.of(context).size.width * 6 / 7,
                //     //color: Colors.black,
                //     child: Padding(
                //       padding:
                //           const EdgeInsets.only(top: 12, bottom: 8, left: 10),
                //       child: Row(
                //         children: [
                //           Padding(
                //             padding: const EdgeInsets.only(right: 160),
                //             child: Column(
                //               children: const [
                //                 Text(
                //                   "Your Cart",
                //                   style: TextStyle(
                //                       fontSize: 18, color: Colors.white),
                //                 ),
                //                 Padding(
                //                   padding: EdgeInsets.only(left: 9, top: 4),
                //                   child: Text(
                //                     "Wish to Checkout?",
                //                     style: TextStyle(
                //                         fontSize: 11, color: Color(0xFF515050)),
                //                   ),
                //                 )
                //               ],
                //             ),
                //           ),
                //           const Icon(
                //             Icons.shopping_cart,
                //             color: Colors.white,
                //           )
                //         ],
                //       ),
                //     ),
                //   ),
                // ),

                //TODO: REDO THIS CODE for report a problem
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    // margin: const EdgeInsets.only(top: 8), YOU CAN DO THIS YOU KNOW THAT RIGHT?
                    // width: MediaQuery.of(context).size.width * 6 / 7,
                    height: 152,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12, left: 20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 110.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "Report a problem",
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 0, top: 4),
                                      child: Text(
                                        "Contact Here",
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: Color(0xFF515050)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Icon(
                                Icons.warning_amber_outlined,
                                color: Color(0xFFFF6565),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.voicemail_outlined,
                                  color: Color(0xFF9ABF00),
                                ),
                                Text(
                                  "  Phone : ",
                                  style: TextStyle(
                                    color: Color(0xFF9ABF00),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                Text(
                                  "  +91 8295647903",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.mail_outline,
                                  color: Color(0xFF9ABF00),
                                ),
                                Text(
                                  "  E-Mail : ",
                                  style: TextStyle(
                                    color: Color(0xFF9ABF00),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                Text(
                                  "  mycycleclinic@gmail.com",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
