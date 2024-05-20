import 'dart:math';

import '../../../shared/models/export.dart';

class AiPlayer {
  AiPlayer._();

  static Point getBestMove(List<List<Side>> field) {
    List<Point> availableMoves = _getAvailableMoves(field);

    if (availableMoves.isNotEmpty) {
      final random = Random();
      int index = random.nextInt(availableMoves.length);
      return availableMoves[index];
    }

    return Point(row: 0, column: 0);
  }

  static List<Point> _getAvailableMoves(List<List<Side>> field) {
    List<Point> availableMoves = [];
    for (int row = 0; row < 3; row++) {
      for (int col = 0; col < 3; col++) {
        if (field[row][col] == Side.none) {
          availableMoves.add(Point(row: row, column: col));
        }
      }
    }
    return availableMoves;
  }
}