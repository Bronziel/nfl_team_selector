import 'dart:math';
import 'dart:collection';
import 'Teams_Class/ClassTeam.dart';

class TeamLogic {
  late List<Team> remainingTeams;
  Team? team1;
  Team? team2;
  final Queue<List<Team>> selectionHistory = Queue<List<Team>>();
  final Queue<List<Team>> futureSelections =
      Queue<List<Team>>(); // New Queue for future selections

  TeamLogic() {
    remainingTeams = List.of(allTeams); // Initialize with all teams
    print(allTeams.length);
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

  void printRemainingTeamNames() {
    print("Remaining Teams:");
    for (Team team in remainingTeams) {
      print(team.name);
    }
  }

  void printRemainingTeamid() {
    print("Remaining Teams id:");
    for (Team team in remainingTeams) {
      print(team.id);
    }
  }

  bool selectTeam(Team selectedTeam) {
    // Store the current selection in history before changing it
    selectionHistory.add([team1!, team2!]);
    futureSelections
        .clear(); // Clear future selections when a new selection is made
    printRemainingTeamNames();
    printRemainingTeamid();
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
      // Push the current state to future selections before undoing
      futureSelections.add([team1!, team2!]);

      final lastSelection = selectionHistory.removeLast();
      team1 = lastSelection[0];
      team2 = lastSelection[1];
      return true; // Indicate that an undo action has occurred
    }
    return false; // No history to undo
  }

  bool redoSelection() {
    if (futureSelections.isNotEmpty) {
      final nextSelection = futureSelections.removeLast();
      team1 = nextSelection[0];
      team2 = nextSelection[1];
      return true; // Indicate that a redo action has occurred
    }
    return false; // No future selections to redo
  }
}
