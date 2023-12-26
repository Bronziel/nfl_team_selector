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
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Nflsvglogo(),
                  ChoseTeamTextWidget(),
                  Nflsvglogo(),
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
                        children: [Teamlogosbox1(teamLogic: teamLogic)],
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
                  const VsTextWidget(),
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
                        children: [Teamlogosbox2(teamLogic: teamLogic)],
                      ),
                    ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (teamLogic.undoSelection()) {
                        setState(
                            () {}); // Update the UI with the previous selection
                      } else {
                        // Handle case where there's no previous selection (e.g., show a message)
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets
                          .zero, // Removes default padding around the image
                      shape: RoundedRectangleBorder(
                        // Optional: To adjust the shape of the button
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: SvgPicture.asset(
                      "web/assets/buttons/Polygon1.svg",
                      width: 98,
                      height: 100,
                      fit: BoxFit
                          .cover, // Ensures the image covers the button area
                    ),
                  ),
                  const SizedBox(width: 20),
                  Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Container(
                        width: 202.69230651855470,
                        height: 198.76922607421875,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const Text(
                        "32/32",
                        style: TextStyle(
                          fontSize: 60.0, // Set font size
                          fontFamily: 'Modak', // Set font family to Modak
                          color: Colors.white, // Set text color (optional)
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (teamLogic.undoSelection()) {
                        setState(
                            () {}); // Update the UI with the previous selection
                      } else {
                        // Handle case where there's no previous selection (e.g., show a message)
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets
                          .zero, // Removes default padding around the image
                      shape: RoundedRectangleBorder(
                        // Optional: To adjust the shape of the button
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: SvgPicture.asset(
                      "web/assets/buttons/Polygon2.svg",
                      width: 98,
                      height: 100,
                      fit: BoxFit
                          .cover, // Ensures the image covers the button area
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

class ChoseTeamTextWidget extends StatelessWidget {
  const ChoseTeamTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Choose Your Team",
      style: TextStyle(
        fontSize: 60,
        fontWeight: FontWeight.w400,
        fontFamily: 'Leckerli One',
      ),
    );
  }
}

class VsTextWidget extends StatelessWidget {
  const VsTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      "VS",
      style: TextStyle(
        fontSize: 60,
        fontWeight: FontWeight.w400,
        fontFamily: "Modak", // Set the font family here
      ),
    );
  }
}

class Nflsvglogo extends StatelessWidget {
  const Nflsvglogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SvgPicture.asset(
        'web/assets/svg/nfl.svg', // Replace with the path to your first SVG image
        width: 235, // Set the width and height as needed
        height: 329,
      ),
    );
  }
}

class Teamlogosbox2 extends StatelessWidget {
  const Teamlogosbox2({
    super.key,
    required this.teamLogic,
  });

  final TeamLogic teamLogic;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400, // Set your desired width
      height:
          400 * (3105 / 3446), // Calculate the height to maintain aspect ratio
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
        child: Image.asset(
          teamLogic.team2!.normalImagePath,
          fit: BoxFit.cover, // Use BoxFit.cover to maintain the aspect ratio
        ),
      ),
    );
  }
}

class Teamlogosbox1 extends StatelessWidget {
  const Teamlogosbox1({
    super.key,
    required this.teamLogic,
  });

  final TeamLogic teamLogic;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400, // Set your desired width
      height:
          400 * (3105 / 3446), // Calculate the height to maintain aspect ratio
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
        child: Image.asset(
          teamLogic.team1!.normalImagePath,
          fit: BoxFit.cover, // Use BoxFit.cover to maintain the aspect ratio
        ),
      ),
    );
  }
}
