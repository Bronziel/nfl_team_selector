// team_data.dart

import 'package:flutter/material.dart';

abstract class Team {
  final String name;
  final String imagePath;

  Team({required this.name, required this.imagePath});
}

class TeamA extends Team {
  TeamA() : super(name: 'Team A', imagePath: 'lib/assets/teamA.png');
}

class TeamC extends Team {
  TeamC()
      : super(
            name: 'New Orleans Saint',
            imagePath: 'lib/assets/mobileteam/saintsMobile');
}

// ... Repeat for TeamB, TeamC and so on until TeamZ and TeamAA, TeamAB... upto TeamAD
//what i need class for afc and nfc and each division. a rival class and fun facts acopying them 
//colors wordmark idk