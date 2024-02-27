import 'package:flutter/material.dart';
import 'package:pizza_app/utils/typography.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 230,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(radius: 36),
                const SizedBox(height: 10),
                Text('John Doe', style: textHeader4(color: defaultTextColor).copyWith(fontSize: 18.89)),
                Text('john.doe@example.com', style: textBodyLight().copyWith(fontSize: 13.22)),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - (230 + 152),
            color: const Color(0xffF4F3F9),
            child: Column(
              children: [
                const SizedBox(height: 50),
                ListTile(
                  leading: Icon(Icons.person, color: redTextColor),
                  title: Text('Profile', style: textBodyLight()),
                  selected: _selectedIndex == 0,
                  onTap: () {
                    // Update the state of the app
                    _onItemTapped(0);
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.payment, color: redTextColor),
                  title: Text('Payment Method', style: textBodyLight()),
                  selected: _selectedIndex == 1,
                  onTap: () {
                    // Update the state of the app
                    _onItemTapped(1);
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.sticky_note_2, color: redTextColor),
                  title: Text('Order History', style: textBodyLight()),
                  selected: _selectedIndex == 2,
                  onTap: () {
                    // Update the state of the app
                    _onItemTapped(2);
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.room, color: redTextColor),
                  title: Text('Addresses', style: textBodyLight()),
                  selected: _selectedIndex == 3,
                  onTap: () {
                    // Update the state of the app
                    _onItemTapped(3);
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.help, color: redTextColor),
                  title: Text('Help Center', style: textBodyLight()),
                  selected: _selectedIndex == 4,
                  onTap: () {
                    // Update the state of the app
                    _onItemTapped(4);
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          Container(
            height: 152,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  leading: Icon(Icons.settings, color: redTextColor),
                  title: Text('Setting', style: textBodyLight()),
                  selected: _selectedIndex == 5,
                  onTap: () {
                    // Update the state of the app
                    _onItemTapped(5);
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.logout, color: redTextColor),
                  title: Text('Logout', style: textBodyLight()),
                  onTap: () {
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
