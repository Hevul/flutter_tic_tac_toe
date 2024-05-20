import 'package:tic_tac_toe/features/game/presentation/game_screen.dart';
import 'package:tic_tac_toe/features/play_mode_choose/presentation/play_mode_choose_screen.dart';
import 'package:tic_tac_toe/features/side_choose/presentation/side_choose_screen.dart';

final routes = {
  '/mode': (context) => const PlayModeChooseScreen(),
  '/side': (context) => const SideChooseScreen(),
  '/game': (context) => const GameScreen(),
};