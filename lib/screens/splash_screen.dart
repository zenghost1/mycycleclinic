import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'screens.dart';


class SplashScreen extends StatefulWidget {
  static String tag = '/beauty_master';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    // setStatusBarColor(appStore.isDarkModeOn ? appStore.scaffoldBackground! : bmLightScaffoldBackgroundColor);
    await 1.seconds.delay;
    finish(context);
    // WalkThroughScreen().launch(context);
    LandingScreen().launch(context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: appStore.isDarkModeOn ? appStore.scaffoldBackground! : bmLightScaffoldBackgroundColor,
      backgroundColor: Color(0xFF000000),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/logo.png', height: 200),
          Text('MYCYCLECLINIC', style: boldTextStyle(size: 20, color:Colors.white)),
        ],
      ).center(),
    );
  }
}
