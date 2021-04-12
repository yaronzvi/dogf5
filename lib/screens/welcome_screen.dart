import 'package:dogf5/screens/login_screen.dart';
import 'package:dogf5/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:dogf5/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/dogfindlogo.png'),
                    height: 60.0,
                  ),
                ),
                Text(
                  ' איתור כלב שאבד',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            // Padding for Go to login screen , color: Colors.lightBlueAccent,
            RoundedButton(
              buttonsTitle: 'log in',
              color: Colors.blueAccent,
              buttonsOnPressed: () {
                Navigator.pushNamed(
                  context,
                  LoginScreen.id,
                );
              },
            ),
            RoundedButton(
              buttonsTitle: 'registration',
              color: Colors.blueAccent,
              buttonsOnPressed: () {
                Navigator.pushNamed(
                  context,
                  RegistrationScreen.id,
                );
              },
            ),
            // RoundedButton(
            //   buttonsTitle: 'I found a Dog',
            //   color: Colors.blueAccent,
            //   buttonsOnPressed: () {
            //     Navigator.pushNamed(
            //       context,
            //       DogFoundScreen.id,
            //     );
            //   },
            // ),

            //Go to registration screen.
          ],
        ),
      ),
    );
  }
}
