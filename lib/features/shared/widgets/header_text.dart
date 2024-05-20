import 'package:flutter/cupertino.dart';
import 'package:tic_tac_toe/constants/app_color.dart';

class HeaderText extends StatelessWidget {
  final String data;
  const HeaderText({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: const TextStyle(
          fontSize: 30,
          color: AppColor.primary,
          fontWeight: FontWeight.w600),
    );
  }
}
