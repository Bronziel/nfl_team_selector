import 'package:flutter/material.dart';

class Ravens {
  static const String name = 'Ravens';
  static const int id = 1;
  static const String normalImagePath =
      'assets/mobileteam/AFC/AFC_North/ravensMobile.jpg';
  static const String winImagePath = 'assets/Team/AFC/AFC_North/ravens-01.jpg';

  static const Color mainColor = Color(0xFF241773); // Powder Blue for Ravens
  static const List<Color> colors = [
    Colors.white,
    Colors.black
  ]; // Additional colors
  static const String division = 'AFC North';
  static const String conference = 'AFC';
  static const String city = 'Baltimore';
  static const String state = 'Maryland';
}

class Bengals {
  static const String name = 'Bengals';
  static const int id = 2;
  static const String normalImagePath =
      'assets/Team/AFC/AFC_North/bengalsMobile.jpg';
  static const String winImagePath = 'assets/Team/AFC/AFC_North/bengals-01.jpg';
  static const Color mainColor = Color.fromARGB(255, 23, 109, 115);
  static const List<Color> colors = [Colors.white, Colors.black];
  static const String division = 'AFC North';
  static const String conference = 'AFC';
  static const String city = 'Cincinnati';
  static const String state = 'Ohio';
}
