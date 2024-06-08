// Dart imports:
import 'dart:math';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:integra_mobile/layout/row.dart';
import 'package:integra_mobile/app/config/theme.dart';

class DataAccordion {
  DataAccordion({
    required this.title,
    required this.content,
    this.icon,
    this.subtitle = "",
    this.contentWidget,
  });

  String title;
  String content;
  Widget? contentWidget;
  String subtitle;
  Widget? icon;
}

class AccordionCommon extends StatefulWidget {
  const AccordionCommon({required this.data, super.key});

  final List<DataAccordion> data;

  @override
  State<AccordionCommon> createState() => _AccordionCommonState();
}

class _AccordionCommonState extends State<AccordionCommon> {
  final currentIndex = <int>[];

  final items = <GlobalKey<ItemAccordionCommonState>>[];

  @override
  void initState() {
    super.initState();

    widget.data.forEach((element) {
      items.add(GlobalKey<ItemAccordionCommonState>());
    });
  }

  void changeIndex(int index) {
    setState(() {
      if (currentIndex.contains(index) == false) {
        currentIndex.add(index);
      } else {
        currentIndex.remove(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List<Widget>.generate(widget.data.length, (index) {
        final data = widget.data[index];
        return itemAccordion(index, data);
      }),
    );
  }

  Widget itemAccordion(int index, DataAccordion data) {
    return ItemAccordionCommon(
      key: items[index],
      data: data,
      index: currentIndex.contains(index),
      onCollapse: (status) {
        for (var i = 0; i < items.length; i++) {
          if (i != index) {
            items[i].currentState?.collapse();
          }
        }
      },
    );
  }
}

class ItemAccordionCommon extends StatefulWidget {
  const ItemAccordionCommon({
    required this.index,
    required this.data,
    super.key,
    this.onTap,
    this.onCollapse,
  });

  final bool index;
  final DataAccordion data;
  final void Function(bool status)? onTap;
  final void Function(bool status)? onCollapse;

  @override
  State<ItemAccordionCommon> createState() => ItemAccordionCommonState();
}

class ItemAccordionCommonState extends State<ItemAccordionCommon>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 200),
  )..addListener(() {
      setState(() {});
    });

  late CurvedAnimation curve =
      CurvedAnimation(parent: animationController, curve: Curves.easeIn);

  late Animation<double> animation =
      Tween<double>(begin: pi / 2, end: pi + (pi / 2))
          .animate(animationController);

  void collapse() {
    if (animationController.status == AnimationStatus.completed) {
      animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          if (animationController.status == AnimationStatus.completed) {
            animationController.reverse();
          } else {
            animationController.forward();
          }
        },
        child: Container(
          padding: const EdgeInsets.all(16).copyWith(
            left: 0,
            right: 0,
          ),
          margin: const EdgeInsets.only(bottom: 0),
          width: double.infinity,
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey,
                width: 0.3,
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _headerAccordion(context),
              SizeTransition(
                sizeFactor: curve,
                child: Column(
                  children: [
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 360),
                      child: widget.data.contentWidget ??
                          Text(
                            widget.data.content,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    color: black, fontWeight: FontWeight.w400),
                          ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row _headerAccordion(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Row(
            children: [
              if (widget.data.icon != null) ...[
                widget.data.icon!,
              ],
              Expanded(
                child: IRow(
                  gap: 5,
                  children: [
                    const Icon(
                      Icons.verified_outlined,
                      size: 18,
                      color: primaryGreen,
                    ),
                    Text(
                      widget.data.title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: primaryGreen, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              // const SizedBox(
              //   width: 10,
              // ),
              // Text(
              //   widget.data.subtitle,
              //   style: Theme.of(context)
              //       .textTheme
              //       .bodySmall
              //       ?.copyWith(color: black, fontWeight: FontWeight.w500),
              // ),
            ],
          ),
        ),
        Transform.rotate(
          // angle: currentIndex.contains(index) ? pi / 2 : pi + (pi / 2),
          angle: animation.value,
          child: const Icon(
            Icons.chevron_left,
            color: darkGrey,
          ),
        )
      ],
    );
  }
}
