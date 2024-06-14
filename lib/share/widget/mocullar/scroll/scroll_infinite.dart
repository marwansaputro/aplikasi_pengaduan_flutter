// Flutter imports:
import 'package:flutter/material.dart';

class ScrollInfinite extends StatefulWidget {
  const ScrollInfinite({
    required this.listWidget,
    required this.endOfPage,
    required this.isMore,
    required this.onRefresh,
    super.key,
    this.scrollDown,
    this.scrollUp,
    this.controllerListener,
    this.axis = Axis.vertical,
    this.controller,
    this.widgetLoading,
    this.loading,
    this.countLoading = 1,
    this.page = 8,
  });
  final List<Widget> listWidget;
  final Axis axis;

  final void Function()? endOfPage;
  final void Function()? scrollUp;
  final void Function()? scrollDown;
  final void Function(ScrollController?)? controllerListener;
  final Future<void> Function() onRefresh;

  final ScrollController? controller;
  final Widget? widgetLoading;

  final int page;
  final int countLoading;
  final bool isMore;
  final bool? loading;

  @override
  ScrollInfiniteState createState() => ScrollInfiniteState();
}

class ScrollInfiniteState extends State<ScrollInfinite> {
  late int currentPosition;
  late ScrollController controller;

  late double lastPosition;
  late double minimalOffset;
  late double maximalOffset;

  bool? loading;

  late int page;
  late int countLoading;
  late bool isMore;

  late List<Widget> listWidget;

  @override
  void initState() {
    super.initState();

    controller = widget.controller ?? ScrollController();

    currentPosition = 5;
    lastPosition = 0;
    minimalOffset = 0;
    maximalOffset = 0;

    loading = widget.loading;
    page = widget.page;
    countLoading = widget.countLoading;

    isMore = widget.isMore;

    listWidget = widget.listWidget;
  }

  @override
  void didUpdateWidget(covariant ScrollInfinite oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.loading != widget.loading) {
      loading = widget.loading;
    }

    if (oldWidget.isMore != widget.isMore) {
      isMore = widget.isMore;
    }

    if (oldWidget.listWidget != widget.listWidget) {
      listWidget = widget.listWidget;
    }

    if (oldWidget.page != widget.page) {
      page = widget.page;
    }
    if (oldWidget.countLoading != widget.countLoading) {
      countLoading = widget.countLoading;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.controllerListener != null) {
      widget.controllerListener?.call(controller);
    }

    controller
      ..addListener(() {
        final isEnd =
            controller.offset - 200 <= controller.position.maxScrollExtent &&
                controller.offset >= controller.position.maxScrollExtent;

        if (isEnd) {
          if (currentPosition < listWidget.length) {
            setState(() {
              currentPosition = currentPosition + page;
            });
          }
          if (widget.endOfPage != null && isMore) widget.endOfPage!();
        }
      })
      ..addListener(() {
        if (lastPosition > controller.offset) {
          if (widget.scrollDown != null) widget.scrollDown?.call();
        }
        if (lastPosition < controller.offset) {
          if (widget.scrollUp != null) widget.scrollUp?.call();
        }

        lastPosition = controller.offset;
      });

    return (Axis.horizontal == widget.axis)
        ? ListView.builder(
            controller: controller,
            scrollDirection: Axis.horizontal,
            itemCount: isMore
                ? listWidget.length + getExtraLoading
                : listWidget.length,
            padding: EdgeInsets.zero,
            itemBuilder: item,
          )
        : RefreshIndicator(
            onRefresh: widget.onRefresh,
            child: ListView.builder(
              controller: controller,
              itemCount: isMore
                  ? listWidget.length + getExtraLoading
                  : listWidget.length,
              padding: EdgeInsets.zero,
              itemBuilder: item,
            ),
          );
  }

  int get getExtraLoading {
    return loading ?? false ? countLoading : 1;
  }

  Widget item(BuildContext context, int index) {
    if (index >= listWidget.length) {
      return widget.widgetLoading ??
          const Padding(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
    }

    return listWidget[index];
  }
}
