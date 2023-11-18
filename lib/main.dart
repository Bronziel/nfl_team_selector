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
  late List<Team> remainingTeams;
  late Team currentTeam1;
  late Team currentTeam2;
  late bool isFinalRound;
  Map<String, int> teamVotes = {};

  @override
  void initState() {
    super.initState();
    remainingTeams = List.of(allTeams);
    currentTeam1 = remainingTeams.removeAt(0);
    currentTeam2 = remainingTeams.removeAt(0);
    isFinalRound = remainingTeams.isEmpty;
    allTeams.forEach((team) {
      teamVotes[team.name] = 0;
    });
  }

  void _selectTeam(Team selectedTeam) {
    teamVotes[selectedTeam.name] = teamVotes[selectedTeam.name]! + 1;

    if (!isFinalRound) {
      if (remainingTeams.isEmpty) {
        // Move to the next round
        remainingTeams = List.of(allTeams);
        currentTeam1 = remainingTeams.removeAt(0);
        currentTeam2 = remainingTeams.removeAt(0);
        isFinalRound = remainingTeams.isEmpty;
      } else {
        // Move to the next pair of teams
        currentTeam1 = remainingTeams.removeAt(0);
        currentTeam2 = remainingTeams.removeAt(0);
      }
    } else {
      // Calculate the winner of the final round
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Select the winner between:'),
            SizedBox(height: 20),
            Text(currentTeam1.name),
            GestureDetector(
              onTap: () => _selectTeam(currentTeam1),
              child: Image.asset(
                currentTeam1.normalImagePath,
                fit: BoxFit.contain,
                width: 100,
                height: 100,
              ),
            ),
            Text('vs'),
            GestureDetector(
              onTap: () => _selectTeam(currentTeam2),
              child: Image.asset(
                currentTeam2.normalImagePath,
                fit: BoxFit.contain,
                width: 100,
                height: 100,
              ),
            ),
            Text(currentTeam2.name),
          ],
        ),
      ),
    );
  }
}
