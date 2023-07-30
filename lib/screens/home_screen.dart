import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';
import 'package:zoom_clone_app/core.dart';
import 'package:zoom_clone_app/screens/history_meeting_screen.dart';
import 'package:zoom_clone_app/screens/setting_screen.dart';
import 'package:zoom_clone_app/utils/colors.dart';

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
    const HistoryMeetingScreen(),
    const Center(child: Text('Contact')),
    const SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: backgroundColor,
        title: const Text('Meet & Chat'),
        centerTitle: true,
      ),
      body: pages[_page],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(30),
            bottom: Radius.circular(30),
          ),
          child: ZoomIn(
            delay: const Duration(seconds: 2),
            child: WaterDropNavBar(
              backgroundColor: footerColor,
              inactiveIconColor: Colors.grey,
              onItemSelected: onPageChanged,
              selectedIndex: _page,
              bottomPadding: 18,
              barItems: [
                BarItem(
                  filledIcon: Icons.comment_bank,
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
          ),
        ),
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
