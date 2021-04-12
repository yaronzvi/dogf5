import 'package:flutter/material.dart';

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter Value',
  hintStyle: TextStyle(color: Colors.black),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const kAnimalsCollection = 'animals';
//animal_avatar_link
//isn
//birth_date
//spices
//primary_color
//implant_chip_id
//name
//gender
//pattern

const kOwnerAnimalsCollection = 'animal_owner';
//ownership_end_date
//ownership_start_date
//animal_isn
//owner_email

const kPersonsCollection = 'persons';
//email
//private_name
//family_name

const kCellularTelephoneCollection = 'cellular_telephone';
//cellular_telephone
//usege
//person_email

const kPersonAddressCollection = 'person_address';
//email
//address_type
//country
//region
//city
//city_street_name
//house_number
//entrance
//flat_number
//floor
//zip_code

const kNewsList = 'newslist';
//author
//datetime
//contents
//show
//line

class Constants {
  // TODO: Replace this with your firebase project URL
  static const String firebaseProjectURL =
      'https://fir-auth-demo-flutter.firebaseapp.com/';
}
