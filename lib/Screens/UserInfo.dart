import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF5957A1),
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('images/steph.jpg'),
            ),
            Text(
              'Stephen Curry',
              style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 40.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'beemaarCurry@gmail.com',
              style: TextStyle(
                fontFamily: 'Source Sans Pro',
                color: Color(0xFF958BD1),
                fontSize: 20.0,
                letterSpacing: 2.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
              width: 150.0,
              child: Divider(
                color: Colors.white,
              ),
            ),
            Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    FontAwesomeIcons.userShield,
                    color: Color(0xFF5957A1),
                  ),
                  title: Text(
                    'Privacy',
                    style: TextStyle(
                      color: Color(0xFF5957A1),
                      fontFamily: 'Source Sans Pro',
                      fontSize: 20.0,
                    ),
                  ),
                )),
            Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.history,
                    color: Color(0xFF5957A1),
                  ),
                  title: Text(
                    'Purchase History',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Color(0xFF5957A1),
                        fontFamily: 'Source Sans Pro'),
                  ),
                )),
            Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.live_help,
                    color: Color(0xFF5957A1),
                  ),
                  title: Text(
                    'Help and Support',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Color(0xFF5957A1),
                        fontFamily: 'Source Sans Pro'),
                  ),
                )),
            Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: Color(0xFF5957A1),
                  ),
                  title: Text(
                    'Settings',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Color(0xFF5957A1),
                        fontFamily: 'Source Sans Pro'),
                  ),
                )),
            Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(FontAwesomeIcons.signOutAlt,
                      color: Color(0xFF5957A1)),
                  title: Text(
                    'Logout',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Color(0xFF5957A1),
                        fontFamily: 'Source Sans Pro'),
                  ),
                )),
          ],
        )),
      ),
    );
  }
}
