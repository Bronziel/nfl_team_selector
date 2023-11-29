// main.dart
import 'package:flutter/material.dart';
import 'team_logic.dart';
import 'Teams_Class/ClassTeam.dart';
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
  late TeamLogic teamLogic;

  @override
  void initState() {
    super.initState();
    teamLogic = TeamLogic();
    teamLogic.pickInitialTeams();
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
            Container(
              child: Row(
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
                  if (teamLogic.team1 != null) // Check if team1 is not null
                    GestureDetector(
                      onTap: () {
                        bool hasChanged =
                            teamLogic.selectTeam(teamLogic.team1!);
                        setState(() {});
                        if (!hasChanged) {
                          _showWinner(teamLogic.team1!);
                        }
                      },
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
                                teamLogic.team1!.normalImagePath,
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
                  if (teamLogic.team2 != null) // Check if team2 is not null
                    GestureDetector(
                      onTap: () {
                        bool hasChanged =
                            teamLogic.selectTeam(teamLogic.team2!);
                        setState(() {});
                        if (!hasChanged) {
                          _showWinner(teamLogic.team2!);
                        }
                      },
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
                                teamLogic.team2!.normalImagePath,
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
