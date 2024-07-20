import 'dart:math';
import 'dart:collection';
import 'Teams_Class/ClassTeam.dart';

class TeamLogic {
  late List<Team> remainingTeams;
  Team? team1;
  Team? team2;
  final Queue<List<dynamic>> selectionHistory = Queue<List<dynamic>>();
  final Queue<List<dynamic>> futureSelections = Queue<List<dynamic>>();

  TeamLogic() {
    remainingTeams = List.of(allTeams);
    print(allTeams.length);
  }
  void reset() {
    remainingTeams = List.of(allTeams); // Reset remainingTeams to the initial list of all teams
    team1 = null; // Reset team1 to null
    team2 = null; // Reset team2 to null
    selectionHistory.clear(); // Clear selection history
    futureSelections.clear(); // Clear future selections
  }
  int getCurrentSelectionNumber() {
    return selectionHistory.length +
        1; // +1 because the first selection is not in history yet
  }

  void pickInitialTeams() {
    team1 = _getRandomTeam();
    print(team1?.name);
    print(team2?.id);
    do {
      team2 = _getRandomTeam();
      print(team2?.name);
      print(team2?.id);
    } while (team1!.id == team2!.id);
  }

  Team _getRandomTeam() {
    final random = Random();
    final index = random.nextInt(remainingTeams.length);
    print(remainingTeams.length);
    return remainingTeams[index];
  }

  bool selectTeam(Team selectedTeam) {
    // Store the current selection and remaining teams in history
    selectionHistory.add([team1!, team2!, List.of(remainingTeams)]);
    futureSelections.clear(); // Clear future selections
    int nonSelectedTeamId =
        (team1!.id == selectedTeam.id) ? team2!.id : team1!.id;
    remainingTeams.removeWhere((team) => team.id == nonSelectedTeamId);

    if (remainingTeams.length > 1) {
      if (team1!.id == selectedTeam.id) {
        team2 = _getNextLowestIdTeam(team1!);
        print(remainingTeams.length);
      } else {
        team1 = _getNextLowestIdTeam(team2!);
        print(remainingTeams.length);
      }
      return true; // State has changed
    } else if (remainingTeams.length == 1) {
      return false; // Winner is determined
    }
    return false; // No change in state
  }

  Team _getNextLowestIdTeam(Team currentTeam) {
    return remainingTeams
        .where((team) => team.id != currentTeam.id)
        .reduce((a, b) => a.id < b.id ? a : b);
  }

  bool undoSelection() {
    if (selectionHistory.isNotEmpty) {
      futureSelections.add([team1!, team2!, List.of(remainingTeams)]);

      final List<dynamic> lastSelection = selectionHistory.removeLast();
      team1 = lastSelection[0] as Team;
      team2 = lastSelection[1] as Team;
      remainingTeams = lastSelection[2] as List<Team>;
      return true;
    }
    return false;
  }

  bool redoSelection() {
    if (futureSelections.isNotEmpty) {
      final List<dynamic> nextSelection = futureSelections.removeLast();
      team1 = nextSelection[0] as Team;
      team2 = nextSelection[1] as Team;
      remainingTeams = nextSelection[2] as List<Team>;
      return true;
    }
    return false;
  }
}
