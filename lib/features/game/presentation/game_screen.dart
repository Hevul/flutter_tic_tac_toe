import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/constants/app_color.dart';
import 'package:tic_tac_toe/features/game/presentation/widgets/export.dart';
import 'package:tic_tac_toe/features/shared/providers/provider.dart';

import '../../play_mode_choose/presentation/widgets/export.dart';

class GameScreen extends ConsumerWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: Container(
          decoration: const BoxDecoration(
            gradient: AppColor.background,
          ),
          child: Column(
            children: [
              SizedBox(height: size.height / 8),
              const ScorePanel(),
              const Flexible(child: Padding(
                padding: EdgeInsets.all(24),
                child: GameField(),
              )),
              const Buttons(),
              SizedBox(height: size.height / 20),
            ],
          ),
        ),
      ),
    );
  }
}