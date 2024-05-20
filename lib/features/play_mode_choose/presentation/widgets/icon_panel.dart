import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tic_tac_toe/constants/app_color.dart';

class IconPanel extends StatelessWidget {
  const IconPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _icon('assets/icons/circle.svg'),
        _icon('assets/icons/cross.svg'),
      ],
    );
  }

  Widget _icon(String path) {
    return SvgPicture.asset(
      path,
      width: 150,
      height: 150,
      colorFilter: const ColorFilter.mode(AppColor.primary, BlendMode.srcIn),
    );
  }
}
