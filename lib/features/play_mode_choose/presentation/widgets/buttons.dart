import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/features/game/presentation/widgets/export.dart';
import 'package:tic_tac_toe/features/play_mode_choose/presentation/widgets/export.dart';
import 'package:tic_tac_toe/features/shared/providers/provider.dart';

class Buttons extends ConsumerWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Button(
            isHighlighted: true,
            onClick: () {
              ref.read(provider).restart();
            },
            text: 'Restart'),
        const SizedBox(height: 20),
        Button(
            isHighlighted: false,
            onClick: () {
              ref.read(provider).endGame();
              Navigator.pop(context);
              Navigator.popAndPushNamed(context, '/mode');
            },
            text: 'End game'),
      ],
    );
  }
}
