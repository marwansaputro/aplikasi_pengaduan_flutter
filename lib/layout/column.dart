// Flutter imports:
import 'package:flutter/material.dart';

class IColumn extends Flex {
  IColumn({
    super.key,
    required List<Widget> children,
    final double gap = 0,
    super.mainAxisAlignment,
    super.crossAxisAlignment,
    super.clipBehavior,
    super.mainAxisSize,
    super.textBaseline,
    super.textDirection,
    super.verticalDirection,
  }) : super(
          direction: Axis.vertical,
          children: List<Widget>.generate((children.length * 2) - 1, (index) {
            if (index % 2 == 1) {
              return SizedBox(
                height: gap,
              );
            }
            return children[index ~/ 2];
          }),
        );
}
