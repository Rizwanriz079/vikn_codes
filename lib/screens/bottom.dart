import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:vikn_codes/screens/profile.dart';

import 'dashboard.dart';

class BottomNavigationLayout extends StatefulWidget {
  @override
  _BottomNavigationLayoutState createState() => _BottomNavigationLayoutState();
}

class _BottomNavigationLayoutState extends State<BottomNavigationLayout> {
  int _currentIndex = 0;

  // Define pages for navigation
  final List<Widget> _pages = [
    DashboardScreen(), // Home icon
    SizedBox(), // Placeholder for Calendar icon
    SizedBox(), // Placeholder for Notification icon
    ProfilePage(), // Profile icon
  ];

  void _onBottomNavItemTapped(int index) {
    if (index == 0) {
      // Navigate to DashboardScreen when the home icon is clicked
      setState(() {
        _currentIndex = index;
      });
    } else if (index == 3) {
      // Navigate to ProfilePage when the profile icon is clicked
      setState(() {
        _currentIndex = index;
      });
    }
    // Do nothing for other icons
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
      body: _pages[_currentIndex],
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: _onBottomNavItemTapped,
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.home,color: Colors.white,),
            title: Text(""),
            selectedColor: Colors.white,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.calendar_today,color: Colors.white,),
            title: Text(""),
            selectedColor: Colors.white,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.notifications,color: Colors.white,),
            title: Text(""),
            selectedColor: Colors.white,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.person,color: Colors.white,),
            title: Text(""),
            selectedColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
