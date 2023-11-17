import 'package:flutter/material.dart';
import 'AFC/AFC_North.dart';
import 'NFC/NFC_North.dart';

class Team {
  final String name;
  final int id; // Add the id property
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
    required this.id, // Include id in the constructor
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

final List<Team> allTeams = [
  Team(
    name: Ravens.name,
    id: Ravens.id,
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
    name: Steelers.name,
    id: Steelers.id,
    normalImagePath: Steelers.normalImagePath,
    winImagePath: Steelers.winImagePath,
    mainColor: Steelers.mainColor,
    colors: Steelers.colors,
    division: Steelers.division,
    conference: Steelers.conference,
    city: Steelers.city,
    state: Steelers.state,
  ),
  Team(
    name: Browns.name,
    id: Browns.id,
    normalImagePath: Browns.normalImagePath,
    winImagePath: Browns.winImagePath,
    mainColor: Browns.mainColor,
    colors: Browns.colors,
    division: Browns.division,
    conference: Browns.conference,
    city: Browns.city,
    state: Browns.state,
  ),
  Team(
    name: Bengals.name,
    id: Bengals.id,
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
