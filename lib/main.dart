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
    remainingTeams = List.of(allTeams); // Make a copy of all teams
    _pickInitialTeams();
  }

  void _pickInitialTeams() {
    team1 = _getRandomTeam();
    do {
      team2 = _getRandomTeam();
    } while (team1!.id == team2!.id); // Ensure team2 is different from team1
  }

  Team _getRandomTeam() {
    final random = Random();
    final index = random.nextInt(remainingTeams.length);
    return remainingTeams[index];
  }

  void _selectTeam(Team selectedTeam) {
    setState(() {
      remainingTeams.remove(
          selectedTeam); // Remove the selected team from the remaining teams
      if (remainingTeams.isNotEmpty) {
        // Replace the non-selected team with the next team with the lowest ID
        Team nonSelectedTeam = (team1!.id == selectedTeam.id) ? team2! : team1!;
        remainingTeams.remove(nonSelectedTeam);
        Team nextTeam = remainingTeams.reduce((a, b) => a.id < b.id ? a : b);
        if (team1!.id == selectedTeam.id) {
          team2 = nextTeam;
        } else {
          team1 = nextTeam;
        }
        remainingTeams
            .add(nonSelectedTeam); // Add the non-selected team back to the pool
      } else {
        // Handle the case when only one team is left
        _showWinner(selectedTeam);
      }
    });
  }

  void _showWinner(Team winnerTeam) {
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
