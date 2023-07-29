import 'package:flutter/material.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';
import 'package:zoom_clone_app/core.dart';
import 'package:zoom_clone_app/screens/history_meeting_screen.dart';
import 'package:zoom_clone_app/utils/colors.dart';

import '../resources/auth_methods.dart';
import 'meeting_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
    MeetingScreen(),
    HistoryMeetingScreen(),
    Center(child: Text('Contact')),
    CustomButton(text: 'Log Out', onPressed: () => AuthMethods().signOut()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: backgroundColor,
        title: Text('Meet & Chat'),
        centerTitle: true,
      ),
      body: pages[_page],
      bottomNavigationBar: WaterDropNavBar(
        backgroundColor: footerColor,
        inactiveIconColor: Colors.grey,
        onItemSelected: onPageChanged,
        selectedIndex: _page,
        barItems: [
          BarItem(
            filledIcon: Icons.comment,
            outlinedIcon: Icons.comment_bank_outlined,
          ),
          BarItem(
              filledIcon: Icons.lock_clock,
              outlinedIcon: Icons.lock_clock_outlined),
          BarItem(
              filledIcon: Icons.person_2,
              outlinedIcon: Icons.person_2_outlined),
          BarItem(
              filledIcon: Icons.settings,
              outlinedIcon: Icons.settings_outlined),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //     backgroundColor: footerColor,
      //     selectedItemColor: Colors.white,
      //     unselectedItemColor: Colors.grey,
      //     onTap: onPageChanged,
      //     currentIndex: _page,
      //     type: BottomNavigationBarType.fixed,
      //     unselectedFontSize: 14,
      //     items: const [
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.comment_bank),
      //         label: 'Meet & Char',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.lock_clock),
      //         label: 'Meetings',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.person_2_outlined),
      //         label: 'Contacts',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.settings_outlined),
      //         label: 'Settings',
      //       ),
      //     ]),
    );
  }
}
