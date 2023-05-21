import 'package:flutter/material.dart';
import 'screens.dart';
import 'package:nb_utils/nb_utils.dart';
import '../fragments/fragments.dart';
import '../utils/BMColors.dart';



class DashboardScreen extends StatefulWidget {
  // bool flag;

  DashboardScreen();

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<DashboardModel> list = getDashboardList();

  int selectedTab = 0;

  Widget getFragment() {
    if (selectedTab == 0) {
      return BMHomeFragment();
    } else if (selectedTab == 1) {
      return BMSearchFragment();
    } else if (selectedTab == 2) {
      return BMRoadAssistanceFragment();
    } else if (selectedTab == 3) {
      return ShoppingCart();
    } else {
      return ProfileScreen();
    }
  }

  @override
  void initState() {
    setStatusBarColor(Colors.black);
    super.initState();
  }

  @override
  void dispose() {
    // if (widget.flag) {
    //   setStatusBarColor(appStore.isDarkModeOn ? appStore.scaffoldBackground! : bmLightScaffoldBackgroundColor);
    // } else {
    //   setStatusBarColor(Colors.transparent);
    // }

    super.dispose();
  }

  Color getDashboardColor() {
    return bmLightScaffoldBackgroundColor;

    // if (!appStore.isDarkModeOn) {
    //   if (selectedTab == 1 || selectedTab == 2 || selectedTab == 3) {
    //     return bmSecondBackgroundColorLight;
    //   } else {
    //     return bmLightScaffoldBackgroundColor;
    //   }
    // } else {
    //   if (selectedTab == 1 || selectedTab == 2 || selectedTab == 3) {
    //     return bmSecondBackgroundColorDark;
    //   } else {
    //     return appStore.scaffoldBackground!;
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getDashboardColor(),
      body: getFragment(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            selectedTab = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        unselectedItemColor: bmPrimaryColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: selectedTab,
        items: list.map((e) {
          int index = list.indexOf(e);
          return BottomNavigationBarItem(
            icon: Image.asset(e.unSelectedIcon,
                height: 24, color: bmPrimaryColor),
            activeIcon: index == 0
                ? Image.asset(e.selectedIcon, height: 24, color: bmPrimaryColor)
                : Image.asset(e.selectedIcon,
                    height: 24, color: bmPrimaryColor),
            label: '',
          );
        }).toList(),
      ).cornerRadiusWithClipRRectOnly(topLeft: 32, topRight: 32),
    );
  }
}

class DashboardModel {
  String selectedIcon;
  String unSelectedIcon;

  DashboardModel({required this.selectedIcon, required this.unSelectedIcon});
}

List<DashboardModel> getDashboardList() {
  List<DashboardModel> list = [];

  list.add(DashboardModel(
      selectedIcon: 'assets/images/beauty_master/home.png',
      unSelectedIcon: 'assets/images/beauty_master/house.png'));
  list.add(DashboardModel(
      selectedIcon: 'assets/images/beauty_master/magnifier.png',
      unSelectedIcon: 'assets/images/beauty_master/search.png'));
  list.add(DashboardModel(
      selectedIcon: 'assets/images/beauty_master/calendar_selected.png',
      unSelectedIcon: 'assets/images/beauty_master/calendar.png'));
  list.add(DashboardModel(
      selectedIcon: 'assets/images/beauty_master/chat_selected.png',
      unSelectedIcon: 'assets/images/beauty_master/chat.png'));
  list.add(DashboardModel(
      selectedIcon: 'assets/images/beauty_master/more_selected.png',
      unSelectedIcon: 'assets/images/beauty_master/more.png'));

  return list;
}
