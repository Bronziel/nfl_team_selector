import 'package:flutter/material.dart';
import 'Teams_Class/ClassTeam.dart';
import 'dart:math';
import 'winLandingPage.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => WinnerPage(winner: winnerTeam),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  child: SvgPicture.asset(
                    'web/assets/svg/nfl.svg', // Replace with the path to your first SVG image
                    width: 235, // Set the width and height as needed
                    height: 329,
                  ),
                ),
                const Text(
                  "Choose Your Team",
                  style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Leckerli One',
                  ),
                ),
                SizedBox(
                  child: SvgPicture.asset(
                    'web/assets/svg/nfl.svg',
                    // Replace with the path to your second SVG image
                    width: 235, // Set the width and height as needed
                    height: 329,
                  ),
                ),
              ],
            ),
            Container(
              padding:
                  const EdgeInsets.all(10), // Optional: Add padding for spacing
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue, // Set the border color
                  width: 2.0, // Set the border width
                ),
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  if (team1 != null) // Check if team1 is not null
                    GestureDetector(
                      onTap: () => _selectTeam(team1!),
                      child: Column(
                        children: [
                          Container(
                            width: 400, // Set your desired width
                            height: 400 *
                                (3105 /
                                    3446), // Calculate the height to maintain aspect ratio
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  20), // Adjust the radius as needed
                              child: Image.asset(
                                team1!.normalImagePath,
                                fit: BoxFit
                                    .cover, // Use BoxFit.cover to maintain the aspect ratio
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.all(
                        10), // Optional: Add padding for spacing
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue, // Set the border color
                        width: 2.0, // Set the border width
                      ),
                    ),
                    child: const SizedBox(
                      height: 20,
                      width: 75,
                    ),
                  ),
                  const SizedBox(
                      width: 10), // Add spacing between the containers and text
                  const Text(
                    "VS",
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Modak", // Set the font family here
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.all(
                        10), // Optional: Add padding for spacing
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue, // Set the border color
                        width: 2.0, // Set the border width
                      ),
                    ),
                    child: const SizedBox(
                      height: 20,
                      width: 75,
                    ),
                  ),
                  const SizedBox(width: 10),
                  if (team2 != null) // Check if team2 is not null
                    GestureDetector(
                      onTap: () => _selectTeam(team2!),
                      child: Column(
                        children: [
                          Container(
                            width: 400, // Set your desired width
                            height: 400 *
                                (3105 /
                                    3446), // Calculate the height to maintain aspect ratio
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  20), // Adjust the radius as needed
                              child: Image.asset(
                                team2!.normalImagePath,
                                fit: BoxFit
                                    .cover, // Use BoxFit.cover to maintain the aspect ratio
                              ),
                            ),
                          )
                        ],
                      ),
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
