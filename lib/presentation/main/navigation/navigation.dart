import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:medcave/core/confiq/colors/appcolor.dart';
import 'package:medcave/presentation/homescreen/AmbulanceScreenDriver/pages/AmbulanceScreenDriver.dart';
import 'package:medcave/presentation/homescreen/AmbulanceScreenUser/pages/AmbulanceScreenUser.dart';
import 'package:medcave/presentation/homescreen/AmbulanceScreenUser/pages/AmbulanceTracker.dart';
import 'package:medcave/presentation/homescreen/HospitalScreen/pages/HospitalScreenUser.dart';
import 'package:medcave/presentation/homescreen/ProfilePage/pages/ProfilePage.dart';

class BNavigationBar extends StatefulWidget {
  const BNavigationBar({super.key});

  @override
  State<BNavigationBar> createState() => _BNavigationBarState();
}

class _BNavigationBarState extends State<BNavigationBar> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Hospitalscreenuser(),
    AmbulancescreenDriver(),
    Profilepage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: GNav(
            color: Colors.black,
            activeColor: AppColor.primaryGreen,
            tabBackgroundColor: AppColor.darkBlack,
            gap: 8,
            tabBorderRadius: 16,
            padding: const EdgeInsets.all(16),
            duration: const Duration(milliseconds: 1000),
            iconSize: 25,
            tabs: const [
              GButton(
                icon: Octicons.home,
                text: 'Home',
              ),
              GButton(
                icon: FontAwesome.plus_squared_alt,
                text: 'Ambulance',
              ),
              GButton(
                icon: Icons.person_2_outlined,
                text: 'Profile',
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
