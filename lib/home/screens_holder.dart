import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:llapreview/collections/collections.dart';
import 'package:llapreview/words/words.dart';
import 'package:llapreview/profile/profile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ScreensHolder extends StatefulWidget {
  @override
  _ScreensHolderState createState() => _ScreensHolderState();
}

class _ScreensHolderState extends State<ScreensHolder> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: const <Widget>[
            WordsScreen(),
            CollectionsScreen(),
            ProfileScreen(),
            ProfileScreen()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() {
          _currentIndex = index;
          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 300), curve: Curves.ease);
        }),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(FontAwesomeIcons.th),
            title: Text('Learn'),
            activeColor: Colors.blue.shade300,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(FontAwesomeIcons.book),
            title: Text('Review'),
            activeColor: Colors.blue.shade300,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(FontAwesomeIcons.bolt),
            title: Text('Practice'),
            activeColor: Colors.blue.shade300,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(FontAwesomeIcons.userAlt),
            title: Text('Profile'),
            activeColor: Colors.blue.shade300,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
