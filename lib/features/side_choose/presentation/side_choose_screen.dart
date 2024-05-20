import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/constants/app_color.dart';
import 'package:tic_tac_toe/features/shared/models/export.dart';
import 'package:tic_tac_toe/features/shared/providers/provider.dart';
import 'package:tic_tac_toe/features/shared/widgets/export.dart';
import 'package:tic_tac_toe/features/side_choose/presentation/widgets/button_with_icon.dart';

class SideChooseScreen extends ConsumerWidget {
  const SideChooseScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: Container(
            decoration: const BoxDecoration(
              gradient: AppColor.background,
            ),
            child: Column(
              children: [
                const Spacer(flex: 3),
                const HeaderText(
                  data: 'Choose a side',
                ),
                const Spacer(
                  flex: 2,
                ),
                ButtonWithIcon(
                  onClick: () {
                    ref.read(provider).chooseSide(Side.o);
                  },
                  side: Side.o,
                ),
                const Spacer(),
                ButtonWithIcon(
                  onClick: () {
                    ref.read(provider).chooseSide(Side.x);
                  },
                  side: Side.x,
                ),
                const Spacer(
                  flex: 2,
                ),
                Button(
                  isHighlighted: true,
                  onClick: () {
                    ref.read(provider).startGame();
                    Navigator.popAndPushNamed(context, '/game');
                  },
                  text: 'Start game',
                ),
                const Spacer(flex: 3),
              ],
            ),
          )),
    );
  }
}
