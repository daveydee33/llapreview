import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavyBar(
      selectedIndex: _selectedIndex,
      showElevation: true, // use this to remove appBar's elevation
      onItemSelected: (index) => setState(() {
        _selectedIndex = index;
        // _pageController.animateToPage(index,
        //     duration: Duration(milliseconds: 300), curve: Curves.ease);
      }),
      items: [
        BottomNavyBarItem(
          icon: Icon(Icons.apps),
          title: Text('Home'),
          activeColor: Colors.red,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.people),
          title: Text('Users'),
          activeColor: Colors.purpleAccent,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.message),
          title: Text('Messages'),
          activeColor: Colors.pink,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.settings),
          title: Text('Settings'),
          activeColor: Colors.blue,
          textAlign: TextAlign.center,
        ),
      ],
    );

    // return BottomNavigationBar(
    //   items: const [
    //     BottomNavigationBarItem(
    //       icon: Icon(
    //         FontAwesomeIcons.graduationCap,
    //         size: 20,
    //       ),
    //       label: 'Topics',
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(
    //         FontAwesomeIcons.bolt,
    //         size: 20,
    //       ),
    //       label: 'Collections',
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(
    //         FontAwesomeIcons.userCircle,
    //         size: 20,
    //       ),
    //       label: 'Profile',
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(
    //         FontAwesomeIcons.book,
    //         size: 20,
    //       ),
    //       label: 'Words & Phrases',
    //     ),
    //   ],
    //   fixedColor: Colors.deepPurple[200],
    //   onTap: (int idx) {
    //     switch (idx) {
    //       case 0:
    //         // do nothing
    //         break;
    //       case 1:
    //         Navigator.pushNamed(context, '/collections');
    //         break;
    //       case 2:
    //         Navigator.pushNamed(context, '/profile');
    //         break;
    //       case 3:
    //         Navigator.pushNamed(context, '/words');
    //     }
    //   },
    // );
  }
}
