import 'package:flutter/material.dart';
import 'package:vendor_app/screens/view_reservations_screen.dart';
import 'package:vendor_app/screens/update_services_screen.dart';
import 'package:vendor_app/screens/my_profile_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    ViewReservationsScreen(),
    UpdateServicesScreen(),
    MyProfileScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.view_list),
            label: 'Reservations',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.update),
            label: 'Services',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
  