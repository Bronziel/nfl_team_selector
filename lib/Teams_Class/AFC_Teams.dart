import 'package:flutter/material.dart';

class Team {
  final String name;
  final String normalImagePath;
  final String winImagePath;
  final Color mainColor; // Main team color
  final List<Color> colors; // Additional team colors
  final String division; // Division name
  final String conference; // Conference name
  final String city; // City name
  final String state; // State name

  Team({
    required this.name,
    required this.normalImagePath,
    required this.winImagePath,
    required this.mainColor,
    required this.colors,
    required this.division,
    required this.conference,
    required this.city,
    required this.state,
  });
}

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

final List<Team> allTeams = [
  Team(
    name: Ravens.name,
    normalImagePath: Ravens.normalImagePath,
    winImagePath: Ravens.winImagePath,
    mainColor: Ravens.mainColor,
    colors: Ravens.colors,
    division: Ravens.division,
    conference: Ravens.conference,
    city: Ravens.city,
    state: Ravens.state,
  ),
  Team(
    name: Bengals.name,
    normalImagePath: Bengals.normalImagePath,
    winImagePath: Bengals.winImagePath,
    mainColor: Bengals.mainColor,
    colors: Bengals.colors,
    division: Bengals.division,
    conference: Bengals.conference,
    city: Bengals.city,
    state: Bengals.state,
  ),
  // Create instances for other teams
];
