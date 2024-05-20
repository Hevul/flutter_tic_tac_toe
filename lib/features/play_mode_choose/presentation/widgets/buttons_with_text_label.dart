import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/features/shared/models/export.dart';
import 'package:tic_tac_toe/features/shared/providers/provider.dart';
import 'package:tic_tac_toe/features/shared/widgets/export.dart';

class ButtonsWithTextLabel extends ConsumerWidget {
  const ButtonsWithTextLabel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const Expanded(
          child: HeaderText(data: 'Choose a play mode'),
        ),
        Expanded(
          flex: 3,
          child: Column(
            children: [
              Button(
                  isHighlighted: true,
                  onClick: () {
                    ref.read(provider).choosePlayMode(PlayMode.withAi);
                    Navigator.pushNamed(context, '/side');
                  },
                  text: PlayMode.withAi.text),
              const SizedBox(height: 20),
              Button(
                  isHighlighted: false,
                  onClick: () {
                    ref.read(provider).choosePlayMode(PlayMode.withFriend);
                    Navigator.pushNamed(context, '/side');
                  },
                  text: PlayMode.withFriend.text),
            ],
          ),
        )
      ],
    );
  }
}
