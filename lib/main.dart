import 'package:flutter/material.dart';
import 'Teams_Class/ClassTeam.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TeamSelector(),
    );
  }
}

class TeamSelector extends StatefulWidget {
  @override
  _TeamSelectorState createState() => _TeamSelectorState();
}

class _TeamSelectorState extends State<TeamSelector> {
  late List<Team> remainingTeams;
  Team? team1;
  Team? team2;

  @override
  void initState() {
    super.initState();
    remainingTeams = List.of(allTeams); // Initialize with all teams
    print(
        'All teams initialized: ${remainingTeams.map((team) => team.name).join(', ')}'); // Print all teams
    _pickInitialTeams();
  }

  void _pickInitialTeams() {
    // Pick two distinct initial teams
    team1 = _getRandomTeam();
    do {
      team2 = _getRandomTeam();
    } while (team1!.id == team2!.id);

    print(
        'Initial random teams: ${team1!.name} and ${team2!.name}'); // Print initial teams
  }

  Team _getRandomTeam() {
    final random = Random();
    final index = random.nextInt(remainingTeams.length);
    return remainingTeams[index];
  }

  void _selectTeam(Team selectedTeam) {
    setState(() {
      // Find the ID of the non-selected team
      int nonSelectedTeamId =
          (team1!.id == selectedTeam.id) ? team2!.id : team1!.id;

      // Remove the non-selected team
      remainingTeams.removeWhere((team) => team.id == nonSelectedTeamId);

      // Update the team1 and team2 for the next round
      if (remainingTeams.length > 1) {
        // If the selected team was team1, keep it and find a new team2
        // If the selected team was team2, keep it and find a new team1
        if (team1!.id == selectedTeam.id) {
          team2 = _getNextLowestIdTeam(team1!);
        } else {
          team1 = _getNextLowestIdTeam(team2!);
        }
      } else if (remainingTeams.length == 1) {
        // Only one team left, declare as winner
        _showWinner(selectedTeam);
      }
    });
  }

  Team _getNextLowestIdTeam(Team currentTeam) {
    return remainingTeams
        .where((team) => team.id != currentTeam.id)
        .reduce((a, b) => a.id < b.id ? a : b);
  }

  void _showWinner(Team winnerTeam) {
    // Show the winner dialog
    print('Winner: ${winnerTeam.name}'); // Print the winner
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Winner: ${winnerTeam.name}'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Congratulations to ${winnerTeam.name}!'),
              Image.asset(
                winnerTeam.normalImagePath,
                fit: BoxFit.contain,
                width: 100,
                height: 100,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Team Selector')),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Select Your Team:'),
            SizedBox(height: 20),
            if (team1 != null) // Check if team1 is not null
              GestureDetector(
                onTap: () => _selectTeam(team1!),
                child: Column(
                  children: [
                    Text(team1!.name),
                    SizedBox(height: 20),
                    Image.asset(
                      team1!.normalImagePath,
                      fit: BoxFit.contain,
                      width: 400,
                      height: 400,
                    ),
                  ],
                ),
              ),
            SizedBox(
              height: 20,
              width: 20,
            ),
            if (team2 != null) // Check if team2 is not null
              GestureDetector(
                onTap: () => _selectTeam(team2!),
                child: Column(
                  children: [
                    Text(team2!.name),
                    SizedBox(height: 20),
                    Image.asset(
                      team2!.normalImagePath,
                      fit: BoxFit.contain,
                      width: 400,
                      height: 400,
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
