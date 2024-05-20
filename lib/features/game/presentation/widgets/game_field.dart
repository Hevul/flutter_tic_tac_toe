import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tic_tac_toe/constants/app_color.dart';
import 'package:tic_tac_toe/features/shared/models/export.dart';
import 'package:tic_tac_toe/features/shared/providers/provider.dart';

class GameField extends ConsumerWidget {
  const GameField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 9,
        itemBuilder: (context, index) {
          int row = index ~/ 3;
          int col = index % 3;

          Side side = ref.read(provider).field[row][col];

          return InkWell(
            onTap: () {
              ref
                  .watch(provider)
                  .setSideIntoPoint(Point(row: row, column: col));
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        color:
                            row > 0 ? AppColor.primary : AppColor.transparent,
                        width: row > 0 ? 8 : 0),
                    left: BorderSide(
                      color: col > 0 ? AppColor.primary : AppColor.transparent,
                      width: col > 0 ? 8 : 0,
                    )),
              ),
              child: side == Side.none
                  ? const SizedBox()
                  : SvgPicture.asset(
                      ref.watch(provider).field[row][col].svgPath,
                      width: 70,
                      colorFilter: const ColorFilter.mode(
                          AppColor.primary, BlendMode.srcIn),
                    ),
            ),
          );
        });
  }
}
