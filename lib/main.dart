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
  Team team1 = _getRandomTeam();
  Team team2 = _getRandomTeam();
  Map<String, int> teamVotes = {};

  static Team _getRandomTeam() {
    final random = Random();
    final index = random.nextInt(allTeams.length);
    return allTeams[index];
  }

  @override
  void initState() {
    super.initState();
    remainingTeams = List.of(allTeams);
    allTeams.forEach((team) {
      teamVotes[team.name] = 0;
    });
  }

  void _selectTeam(Team selectedTeam) {
    teamVotes[selectedTeam.name] = teamVotes[selectedTeam.name]! + 1;
    if (remainingTeams.isNotEmpty) {
      team1 = _getRandomTeam();
      team2 = _getRandomTeam();
    } else {
      final winner =
          teamVotes.entries.reduce((a, b) => a.value > b.value ? a : b).key;
      final winnerTeam = allTeams.firstWhere((t) => t.name == winner);

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

    setState(() {});
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
            SizedBox(
              height: 20,
              width: 20,
            ),
            GestureDetector(
              onTap: () => _selectTeam(team1),
              child: Column(
                children: [
                  Text(team1.name),
                  SizedBox(
                    height: 20,
                    width: 20,
                  ),
                  Image.asset(
                    team1.normalImagePath,
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
            GestureDetector(
              onTap: () => _selectTeam(team2),
              child: Column(
                children: [
                  Text(team2.name),
                  SizedBox(height: 20),
                  Image.asset(
                    team2.normalImagePath,
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
