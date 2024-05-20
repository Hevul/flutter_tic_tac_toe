import 'package:flutter/material.dart';

class AppColor {
  AppColor._();

  static const LinearGradient background = LinearGradient(
      colors: [Color(0xffA969E3), Color(0xff704BCE)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);

  static const Color primary = Color(0xffffffff);
  static const Color secondary = Color(0xffA969E3);
  static const Color transparent = Colors.transparent;
}