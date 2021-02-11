import 'package:wlcm/screens/health_page.dart';
import 'package:wlcm/screens/home_page.dart';
import 'package:wlcm/screens/prescription_list.dart';
import 'package:wlcm/screens/profile_page.dart';
import 'package:wlcm/screens/reminder_page.dart';
import 'package:wlcm/screens/search_doctor_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wlcm/screens/test_doctor_info.dart';
import 'tab_item.dart';
import 'bottom_navigation.dart';
// import 'package:flutter_svg/flutter_svg.dart';

const String prescription_with_pen = 'assets/icons/prescription_with_pen.svg';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  static int currentTab = 0;
  final profileIcon = SvgPicture.asset('assets/icons/user.svg');
  final List<TabItem> tabs = [
    TabItem(
      tabName: "Home",
      icon: AssetImage('assets/icons/home.png'),
      page: HomePage(),
    ),
    TabItem(
      tabName: "Test",
      icon: AssetImage('assets/icons/caduceus.png'),
      page: TestDoctorInfo(),
    ),
    TabItem(
      tabName: "Health",
      icon: AssetImage('assets/icons/heart.png'),
      page: HealthPage(),
    ),
    TabItem(
      tabName: "Consultations",
      icon: AssetImage('assets/icons/medical-records.png'),
      page: PrescriptionList(),
    ),
    // TabItem(
    //   tabName: "Search Doctor",
    //   // icon: Icons.search_rounded,
    //   icon: AssetImage('assets/icons/med_search.png'),
    //   page: SearchDoctor(),
    //   // page: TestDoctorInfo(),
    // ),
    // TabItem(
    //   tabName: "Reminder",
    //   // icon: Icons.notifications,
    //   icon: AssetImage('assets/icons/alarm.png'),
    //   page: ReminderPage(),
    // ),
    TabItem(
      tabName: "Profile",
      // icon: Icons.person_rounded,
      icon: AssetImage('assets/icons/profile2.png'),

      page: ProfilePage(),
    ),
  ];

  AppState() {
    tabs.asMap().forEach((index, details) {
      details.setIndex(index);
    });
  }

  void _selectTab(int index) {
    if (index == currentTab) {
      tabs[index].key.currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() => currentTab = index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await tabs[currentTab].key.currentState.maybePop();
        if (isFirstRouteInCurrentTab) {
          // if not on the 'main' tab
          if (currentTab != 0) {
            // select 'main' tab
            _selectTab(0);
            // back button handled by app
            return false;
          }
        }
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        extendBody: true,
        body: IndexedStack(
          index: currentTab,
          children: tabs.map((e) => e.page).toList(),
        ),
        bottomNavigationBar: BottomNavigation(
          onSelectTab: _selectTab,
          tabs: tabs,
        ),
      ),
    );
  }
}
