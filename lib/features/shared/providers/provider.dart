import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/features/shared/models/export.dart';

final provider = ChangeNotifierProvider<TicTacToeModel>(
    (ref) => TicTacToeModel());
