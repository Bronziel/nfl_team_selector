import 'package:flutter/material.dart';
import 'Teams_Class/ClassTeam.dart';

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
  late List<Team> currentTeams;
  Map<String, int> teamVotes = {};

  @override
  void initState() {
    super.initState();
    currentTeams = List.of(allTeams);
    allTeams.forEach((team) {
      teamVotes[team.name] = 0;
    });
  }

  void _selectTeam(Team selectedTeam) {
    // Find the index of the selected team in the current list
    final index =
        currentTeams.indexWhere((team) => team.name == selectedTeam.name);

    if (index >= 0) {
      teamVotes[selectedTeam.name] = teamVotes[selectedTeam.name]! + 1;
      currentTeams.removeAt(index);

      // If there's only one team left, declare it as the winner
      if (currentTeams.length == 1) {
        final winner = currentTeams[0];
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Winner: ${winner.name}'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Congratulations to ${winner.name}!'),
                  Image.asset(
                    winner.normalImagePath,
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
    }

    // Proceed to the next pair of teams
    _showNextPairOfTeams();
  }

  void _showNextPairOfTeams() {
    if (currentTeams.length >= 2) {
      final team1 = currentTeams[0];
      final team2 = currentTeams[1];
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Select the Winner'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Click on the team you think should win:'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                        _selectTeam(team1);
                      },
                      child: Column(
                        children: [
                          Text(team1.name),
                          Image.asset(
                            team1.normalImagePath,
                            fit: BoxFit.contain,
                            width: 100,
                            height: 100,
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                        _selectTeam(team2);
                      },
                      child: Column(
                        children: [
                          Text(team2.name),
                          Image.asset(
                            team2.normalImagePath,
                            fit: BoxFit.contain,
                            width: 100,
                            height: 100,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Initially, show the first pair of teams
    if (currentTeams.length >= 2) {
      final team1 = currentTeams[0];
      final team2 = currentTeams[1];
      return AlertDialog(
        title: Text('Select the Winner'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Click on the team you think should win:'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    _selectTeam(team1);
                  },
                  child: Column(
                    children: [
                      Text(team1.name),
                      Image.asset(
                        team1.normalImagePath,
                        fit: BoxFit.contain,
                        width: 100,
                        height: 100,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    _selectTeam(team2);
                  },
                  child: Column(
                    children: [
                      Text(team2.name),
                      Image.asset(
                        team2.normalImagePath,
                        fit: BoxFit.contain,
                        width: 100,
                        height: 100,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    } else {
      // If there's only one team left, display the winner
      final winner = currentTeams.isNotEmpty ? currentTeams[0] : null;
      return Scaffold(
        appBar: AppBar(title: Text('Winner')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Winner: ${winner?.name ?? "No winner"}'),
              if (winner != null)
                Image.asset(
                  winner.normalImagePath,
                  fit: BoxFit.contain,
                  width: 200,
                  height: 200,
                ),
            ],
          ),
        ),
      );
    }
  }
}
