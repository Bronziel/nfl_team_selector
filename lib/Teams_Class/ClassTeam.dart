import 'package:flutter/material.dart';
import 'AFC Team List/AfcNorthTeamList.dart';
import 'NFC Team List/NfcNorthTeamList.dart';

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

final List<Team> nfcTeams = [
  ...nfcNorthTeams,
];
final List<Team> allTeams = [
  ...afcNorthTeams,
  ...nfcNorthTeams,
  // Add other division and conference lists here
];
