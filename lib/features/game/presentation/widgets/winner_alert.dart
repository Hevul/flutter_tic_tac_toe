import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tic_tac_toe/constants/app_color.dart';
import 'package:tic_tac_toe/features/shared/models/export.dart';
import 'package:tic_tac_toe/features/shared/providers/provider.dart';
import 'package:tic_tac_toe/features/shared/widgets/export.dart';

class WinnerAlert extends ConsumerStatefulWidget {
  const WinnerAlert({super.key});

  @override
  ConsumerState<WinnerAlert> createState() => _WinnerAlertState();
}

class _WinnerAlertState extends ConsumerState<WinnerAlert> {
  @override
  void initState() {
    super.initState();
    _startDismissTimer();
  }

  void _startDismissTimer() {
    Future.delayed(const Duration(milliseconds: 800), () {
      if (mounted) {
        Navigator.of(context).pop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Side winnerSide = ref.watch(provider).winnerSide;

    bool isDraw = winnerSide == Side.none;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 68),
      child: Container(
        height: size.height / 5,
        decoration: const BoxDecoration(
          gradient: AppColor.background,
          borderRadius: BorderRadius.all(Radius.circular(40)),
        ),
        child: Column(
          children: [
            const Spacer(flex: 2),
            HeaderText(
                data: isDraw ? 'Draw!' : 'Winner'),
            isDraw ? const SizedBox() : const Spacer(flex: 1),
            isDraw
                ? const SizedBox()
                : SvgPicture.asset(
                    winnerSide.svgPath,
                    width: 50,
                    colorFilter: const ColorFilter.mode(
                      AppColor.primary,
                      BlendMode.srcIn,
                    ),
                  ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
