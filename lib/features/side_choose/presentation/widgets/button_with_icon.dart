import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tic_tac_toe/constants/app_color.dart';
import 'package:tic_tac_toe/features/shared/models/export.dart';
import 'package:tic_tac_toe/features/shared/providers/provider.dart';

class ButtonWithIcon extends ConsumerWidget {
  final Side side;
  final VoidCallback onClick;

  const ButtonWithIcon({super.key, required this.side, required this.onClick});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isHighlighted = ref.watch(provider).ownSide == side;

    return InkWell(
      onTap: () {
        onClick();
      },
      child: Container(
        width: 220,
        height: 180,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(40)),
            color: isHighlighted ? AppColor.primary : AppColor.transparent),
        child: SvgPicture.asset(
          side.svgPath,
          width: 100,
          height: 100,
          colorFilter: ColorFilter.mode(
              isHighlighted ? AppColor.secondary : AppColor.primary,
              BlendMode.srcIn),
        ),
      ),
    );
  }
}

