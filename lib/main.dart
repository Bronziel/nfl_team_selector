import 'package:flutter/material.dart';
import 'team_selector.dart';

void main() => runApp(TeamSelectorApp());

class TeamSelectorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Team Selector',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Team Selector'),
        ),
        body: TeamSelector(),
      ),
    );
  }
}
