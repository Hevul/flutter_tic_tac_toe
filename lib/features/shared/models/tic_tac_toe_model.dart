import 'package:flutter/material.dart';
import 'package:tic_tac_toe/app/tic_tac_toe_app.dart';
import 'package:tic_tac_toe/features/game/presentation/utils/ai_player.dart';
import 'package:tic_tac_toe/features/game/presentation/utils/tic_tac_toe_winner_checker.dart';
import 'package:tic_tac_toe/features/game/presentation/widgets/export.dart';
import 'package:tic_tac_toe/features/shared/models/export.dart';

class TicTacToeModel extends ChangeNotifier {
  PlayMode _playMode;
  Side _side;
  Side _ownSide;
  Side _winnerSide;
  List<List<Side>> _field;
  int _ownScore;
  int _opponentScore;

  TicTacToeModel()
      : _playMode = PlayMode.withAi,
        _field = List.generate(3, (_) => List.filled(3, Side.none)),
        _side = Side.none,
        _ownScore = 0,
        _ownSide = Side.o,
        _opponentScore = 0,
        _winnerSide = Side.none;

  PlayMode get playMode => _playMode;
  Side get ownSide => _ownSide;
  Side get side => _side;
  Side get winnerSide => _winnerSide;
  int get ownScore => _ownScore;
  int get opponentScore => _opponentScore;
  List<List<Side>> get field {
    return List.unmodifiable(_field);
  }

  void chooseSide(Side side) {
    _ownSide = side;
    _side = side;
    notifyListeners();
  }

  void choosePlayMode(PlayMode mode) {
    _playMode = mode;
    notifyListeners();
  }

  void startGame() {
    _side = _ownSide;
    notifyListeners();
  }

  void setSideIntoPoint(Point point) {
    if (_field[point.row][point.column] == _side ||
        _field[point.row][point.column] != Side.none) {
      return;
    }

    _field[point.row][point.column] = _side;
    _side = _side.toggle;

    if (_playMode == PlayMode.withAi) {
      Point aiMove = AiPlayer.getBestMove(field);

      if (aiMove.column != -1) {
        _field[aiMove.row][aiMove.column] = _side;
        _side = _side.toggle;
      }
    }

    Side winner = TicTacToeWinnerChecker.getWinner(field);
    if (winner != Side.none) {
      if (winner == _ownSide) {
        _winnerSide = _ownSide;
        _ownScore++;
      } else {
        _winnerSide = _ownSide.toggle;
        _opponentScore++;
      }

      print(winnerSide.name);
      _showWinnerDialog();
      restart();
    }

    if (_isEndGame()) {
      _winnerSide = Side.none;
      _showWinnerDialog();
      restart();
    }

    notifyListeners();
  }

  void endGame() {
    _playMode = PlayMode.withAi;
    _ownSide = Side.o;
    _field = List.generate(3, (_) => List.filled(3, Side.none));
    _ownScore = 0;
    _opponentScore = 0;
    _winnerSide = Side.none;
  }

  void restart() {
    _field = List.generate(3, (_) => List.filled(3, Side.none));
    notifyListeners();
  }

  void _showWinnerDialog() {
    showDialog(
        context: navigatorKey.currentContext!,
        builder: (context) => const WinnerAlert());
  }

  bool _isEndGame() {
    List<Side> sides = _field.expand((row) => row).toList();
    return !sides.any((s) => s == Side.none);
  }
}
