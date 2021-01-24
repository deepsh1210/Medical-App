import 'package:flutter/material.dart';
import 'package:medic/Screens/HomeScreen.dart';
import 'package:medic/Screens/Virus.dart';
import 'package:medic/Screens/UserInfo.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RoutingService extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RoutingServiceState();
}

class _RoutingServiceState extends State<RoutingService> {
  final _myPages = [
    OnboardingScreen(),
    Virus(),
    UserInfo(),
  ];

  int _selectedPage = 0;
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: _myPages,
        onPageChanged: (index) {
          setState(() {
            _selectedPage = index;
          });
        },
        controller: _pageController,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _selectedPage,
        height: 60.0,
        items: <Widget>[
          FaIcon(FontAwesomeIcons.home, size: 30, color: Colors.white),
          Icon(FontAwesomeIcons.lungsVirus, size: 30, color: Colors.white),
          Icon(FontAwesomeIcons.userAlt, size: 30, color: Colors.white),
        ],
        color: Colors.teal,
        buttonBackgroundColor: Colors.black,
        backgroundColor: Colors.black,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _selectedPage = index;
            print(_selectedPage.toDouble());
            _pageController.animateToPage(_selectedPage,
                duration: Duration(milliseconds: 300), curve: Curves.linear);
          });
        },
      ),
    );
  }
}
