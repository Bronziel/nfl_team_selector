import 'package:flutter/material.dart';
import 'package:select_team/Teams_Class/NFC%20Team%20List/NfcWestTeamList.dart';

import 'NFC Team List/NfcNorthTeamList.dart';
import 'NFC Team List/NfcEastTeamList.dart';
import 'NFC Team List/NfcWestTeamList.dart';
import 'NFC Team List/NfcSouthTeamList.dart';

import 'AFC Team List/AfcNorthTeamList.dart';
import 'AFC Team List/AfcWestTeamList.dart';
import 'AFC Team List/AfcEastTeamList.dart';
import 'AFC Team List/AfcSouthTeamList.dart';

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
  ...nfcWestTeams,
  ...nfcEastTeams,
  ...nfcSouthTeams,
  ...afcNorthTeams,
  ...afcWestTeams,
  ...afcEastTeams,
  ...afcSouthTeams,
];
final List<Team> allTeams = [
  ...afcNorthTeams,
  ...nfcNorthTeams,
  ...nfcWestTeams,
  ...nfcEastTeams,
  ...nfcSouthTeams,
  ...afcEastTeams,
  ...afcSouthTeams,

  // Add other division and conference lists here
];
