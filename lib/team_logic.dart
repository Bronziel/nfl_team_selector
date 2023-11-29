// team_logic.dart
import 'dart:math';
import 'Teams_Class/ClassTeam.dart';

class TeamLogic {
  late List<Team> remainingTeams;
  Team? team1;
  Team? team2;

  TeamLogic() {
    remainingTeams = List.of(allTeams); // Initialize with all teams
  }

  void pickInitialTeams() {
    team1 = _getRandomTeam();
    do {
      team2 = _getRandomTeam();
    } while (team1!.id == team2!.id);
  }

  Team _getRandomTeam() {
    final random = Random();
    final index = random.nextInt(remainingTeams.length);
    return remainingTeams[index];
  }

  bool selectTeam(Team selectedTeam) {
    int nonSelectedTeamId =
        (team1!.id == selectedTeam.id) ? team2!.id : team1!.id;
    remainingTeams.removeWhere((team) => team.id == nonSelectedTeamId);

    if (remainingTeams.length > 1) {
      if (team1!.id == selectedTeam.id) {
        team2 = _getNextLowestIdTeam(team1!);
      } else {
        team1 = _getNextLowestIdTeam(team2!);
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
}
