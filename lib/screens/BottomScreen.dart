import 'package:flutter/material.dart';
import 'package:tes2/Screens/HomeScreen.dart';
import 'package:tes2/screens/UserScreen.dart';
import 'package:tes2/screens/CartScreen.dart';

class BottomNav extends StatefulWidget {
  final int selectedindex;
  const BottomNav({required this.selectedindex, super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedindex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    CartScreens(),
    UserScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _widgetOptions.elementAt(_selectedindex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedindex,
        onTap: (index) {
          setState(() {
            _selectedindex = index;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'User',
          ),
        ],
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.black,
      ),
    );
  }
}
