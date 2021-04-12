import 'package:dogf5/screens/Dog_Found_Screen.dart';
import 'package:flutter/material.dart';
import 'package:dogf5/screens/welcome_screen.dart';
import 'package:dogf5/screens/login_screen.dart';
import 'package:dogf5/screens/registration_screen.dart';
import 'package:dogf5/screens/owner_screen.dart';
import 'package:dogf5/screens/dog_screen.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:dogf5/screens/loading.dart';

void main() async {
  // Ensure that Firebase is initialized
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(DogFind());
}

class DogFind extends StatefulWidget {
  // Create the initialization Future outside of `build`:
  @override
  _DogFindState createState() => _DogFindState();
}

class _DogFindState extends State<DogFind> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: DogFoundScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        OwnerScreen.id: (context) => OwnerScreen(),
        DogScreen.id: (context) => DogScreen(),
        DogFoundScreen.id: (context) => DogFoundScreen(),
      },
    );
  }
}
