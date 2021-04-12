import 'package:flutter/material.dart';
import 'package:dogf5/constants/constants.dart';

class DogFoundScreen extends StatefulWidget {
  static String id = 'DogFoundScreen';
  @override
  _DogFoundScreenState createState() => _DogFoundScreenState();
}

class _DogFoundScreenState extends State<DogFoundScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'TBD',
            style: kSendButtonTextStyle,
          )
        ],
      ),
    );
  }
}
