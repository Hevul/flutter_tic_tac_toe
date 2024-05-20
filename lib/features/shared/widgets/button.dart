import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants/app_color.dart';
import 'package:tic_tac_toe/features/shared/models/export.dart';

class Button extends StatefulWidget {
  final String text;
  final bool isHighlighted;
  final VoidCallback onClick;

  const Button({super.key, required this.isHighlighted, required this.onClick, required this.text});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onClick,
      child: Container(
        width: 220,
        height: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: widget.isHighlighted ? AppColor.primary : AppColor.transparent,
            border: Border.all(color: AppColor.primary.withOpacity(0.3), width: 2),
            borderRadius: const BorderRadius.all(Radius.circular(22)),
            boxShadow: widget.isHighlighted
                ? [
                    BoxShadow(
                        color: AppColor.primary.withOpacity(0.6),
                        blurRadius: 4,
                        spreadRadius: 2,
                        offset: const Offset(0, 0))
                  ]
                : []),
        child: Text(widget.text,
            style: TextStyle(
                color: widget.isHighlighted ? AppColor.secondary : AppColor.primary,
                fontWeight: FontWeight.w500,
                fontSize: 18)),
      ),
    );
  }
}
