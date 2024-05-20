import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants/app_color.dart';
import 'package:tic_tac_toe/features/play_mode_choose/presentation/widgets/export.dart';

class PlayModeChooseScreen extends StatelessWidget {
  const PlayModeChooseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: Container(
          decoration: const BoxDecoration(
            gradient: AppColor.background,
          ),
          child: const Column(
            children: [
              Expanded(
                flex: 4,
                child: IconPanel(),
              ),
              Expanded(
                flex: 3,
                child: ButtonsWithTextLabel(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
