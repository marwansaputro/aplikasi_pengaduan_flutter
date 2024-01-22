// Dart imports:

// Flutter imports:
import 'package:flutter/material.dart';

class IRow extends Flex {
  IRow({
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
          direction: Axis.horizontal,
          children: List<Widget>.generate((children.length * 2) - 1, (index) {
            if (index % 2 == 1) {
              return SizedBox(
                width: gap,
              );
            }
            return children[index ~/ 2];
          }),
        );
}
