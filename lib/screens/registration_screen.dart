import 'package:dogf5/screens/Dog_Found_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dogf5/components/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/services.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:dogf5/constants/constants.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String name;
  String email;
  String userPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/dogfindlogo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                autofocus: true,
                onChanged: (value) {
                  name = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your name',
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                autofocus: true,
                onChanged: (value) {
                  email = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your email',
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextFormField(
                textAlign: TextAlign.center,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                obscureText: true,
                onChanged: (value) {
                  userPassword = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your password',
                ),
                validator: (value) {
                  if (value.isEmpty) return "This form value must be filled";
                  if (value.length < 7)
                    return "Password must be at least 7 characters long";
                  return null;
                },
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                  buttonsTitle: 'Register',
                  color: Colors.blueAccent,
                  buttonsOnPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });

                    try {
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                              email: email, password: userPassword);
                      if (newUser != null) {
                        newUser.user
                            .updateProfile(displayName: name)
                            .then((value) => null)
                            .catchError(showError());
                        Navigator.pushNamed(context, DogFoundScreen.id);
                      }
                      setState(() {
                        showSpinner = false;
                      });
                    } on FirebaseAuthException catch (signUpError) {
                      print(signUpError.message);

                      Navigator.pop(context);
                    } finally {
                      setState(() {
                        showSpinner = false;
                      });
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}

showError() {
  print('error saving name');
  return;
}
