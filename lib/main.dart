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
    setState(() {
      teamVotes[selectedTeam.name] = teamVotes[selectedTeam.name]! + 1;
      currentTeams.remove(selectedTeam);
      if (currentTeams.isEmpty) {
        currentTeams = List.of(allTeams);
      }
    });
  }

  Widget _teamImageWidget(Team team) {
    Color backgroundColor;

    backgroundColor = team.mainColor;

    return Container(
      margin: const EdgeInsets.all(8.0),
      width: 600,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 600,
            decoration: BoxDecoration(
              color: backgroundColor,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: GestureDetector(
                onTap: () {
                  _selectTeam(team);
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Image.asset(
                    team.normalImagePath,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (currentTeams.length < 2) {
      final winner =
          teamVotes.entries.reduce((a, b) => a.value > b.value ? a : b).key;
      final winnerTeam = allTeams.firstWhere((t) => t.name == winner);
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('This is your team'),
            _teamImageWidget(winnerTeam),
            Text(winnerTeam.name),
          ],
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(title: const Text('Pick Your Team')),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: currentTeams.map((team) => _teamImageWidget(team)).toList(),
      ),
    );
  }
}
