import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tic_tac_toe/constants/app_color.dart';
import 'package:tic_tac_toe/features/shared/models/export.dart';
import 'package:tic_tac_toe/features/shared/providers/provider.dart';

class ScorePanel extends ConsumerWidget {
  const ScorePanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isWithAi = ref.watch(provider).playMode == PlayMode.withAi;
    bool isOwnSide = ref.watch(provider).ownSide == ref.watch(provider).side;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Container(
              width: 40,
              height: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isOwnSide ? AppColor.primary : AppColor.transparent,
                borderRadius: const BorderRadius.all(Radius.circular(6)),
              ),
              child: SvgPicture.asset(ref.watch(provider).ownSide.svgPath,
                  width: 24,
                  colorFilter: ColorFilter.mode(
                      isOwnSide ? AppColor.secondary : AppColor.primary,
                      BlendMode.srcIn)),
            ),
            _user(isWithAi ? 'You' : 'Player 1'),
          ],
        ),
        _spacer(),
        Container(
          alignment: Alignment.center,
          width: 106,
          height: 40,
          decoration: const BoxDecoration(
              color: AppColor.primary,
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Text(
            '${ref.watch(provider).ownScore} - ${ref.watch(provider).opponentScore}',
            style: const TextStyle(
                color: AppColor.secondary,
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
        ),
        _spacer(),
        Column(
          children: [
            Container(
              width: 40,
              height: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isOwnSide ? AppColor.transparent : AppColor.primary,
                borderRadius: const BorderRadius.all(Radius.circular(6)),
              ),

              child: SvgPicture.asset(ref.watch(provider).ownSide.toggle.svgPath,
                  width: 22,
                  colorFilter:
                  ColorFilter.mode(
                      isOwnSide ? AppColor.primary : AppColor.secondary,
                      BlendMode.srcIn)),
            ),
            _user(isWithAi ? 'AI' : 'Player 2'),
          ],
        ),
      ],
    );
  }

  Widget _user(String user) {
    return Text(
      user,
      style: const TextStyle(
          color: AppColor.primary, fontSize: 20, fontWeight: FontWeight.w500),
    );
  }

  Widget _spacer() {
    return const SizedBox(width: 28);
  }
}
