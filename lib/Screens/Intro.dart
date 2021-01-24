import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:medic/services/Routing.dart';
import 'package:flutter/cupertino.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Image.asset(
            'images/getStarted.png',
          ),
          SizedBox(height: 60.0),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: GestureDetector(
              child: Container(
                width: 200.0,
                decoration: ShapeDecoration(
                  shadows: [BoxShadow(color: Colors.grey, blurRadius: 10.0)],
                  color: Color(0xFF3750B2),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15.0, 15.0, 0.0, 15.0),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    CircleAvatar(
                      backgroundColor: Colors.greenAccent,
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: Color(0xFF3750B2),
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  PageTransition(
                      curve: Curves.linear,
                      duration: Duration(seconds: 1),
                      child: RoutingService(),
                      type: PageTransitionType.rightToLeftWithFade),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
