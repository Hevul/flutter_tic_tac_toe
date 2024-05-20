import 'package:tic_tac_toe/features/shared/models/export.dart';

class TicTacToeWinnerChecker {
  TicTacToeWinnerChecker._();

  static Side getWinner(List<List<Side>> field) {
    Side winner = _checkRows(field);
    if (winner != Side.none) {
      return winner;
    }

    winner = _checkColumns(field);
    if (winner != Side.none) {
      return winner;
    }

    winner = _checkDiagonals(field);
    if (winner != Side.none) {
      return winner;
    }

    return Side.none;
  }

  static Side _checkRows(List<List<Side>> field) {
    for (int row = 0, winCount = 0; row < field.length; row++, winCount = 0) {
      for (int col = 0; col < field[0].length; col++) {
        if (field[row][0] == field[row][col] && field[row][0] != Side.none) {
          winCount++;
        } else {
          break;
        }

        if (winCount == field[0].length) {
          return field[row][0];
        }
      }
    }

    return Side.none;
  }

  static Side _checkColumns(List<List<Side>> field) {
    for (int col = 0, winCount = 0;
        col < field[1].length;
        col++, winCount = 0) {
      for (int row = 0; row < field.length; row++) {
        if (field[0][col] == field[row][col] && field[0][col] != Side.none) {
          winCount++;
        } else {
          break;
        }

        if (winCount == field.length) {
          return field[0][col];
        }
      }
    }

    return Side.none;
  }

  static Side _checkDiagonals(List<List<Side>> field) {
    for (int i = 0, winCount = 0; i < field.length; i++) {
      if (field[0][0] == field[i][i]) {
        winCount++;
      } else {
        break;
      }
      if (winCount == field.length) {
        return field[0][0];
      }
    }

    int col = field.length - 1;

    for (int i = 0, winCount = 0; i < field.length; i++) {
      if (field[0][col] == field[i][col - i]) {
        winCount++;
      } else {
        break;
      }
      if (winCount == field.length) {
        return field[0][2];
      }
    }

    return Side.none;
  }
}
