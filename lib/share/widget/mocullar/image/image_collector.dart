// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// Package imports:
import 'package:cached_network_image/cached_network_image.dart';

class ImageCollector extends StatefulWidget {
  const ImageCollector({
    required this.imageUrl,
    super.key,
    this.showBackground = true,
    this.boxFit = BoxFit.cover,
    this.color,
    this.placeholder,
    this.colorPlaceholder,
    this.loadingWidget,
  });

  final String imageUrl;
  final bool showBackground;
  final BoxFit boxFit;
  final Color? color;
  final Color? colorPlaceholder;

  final Widget? placeholder;
  final Widget? loadingWidget;

  ImageCollectorState createState() => ImageCollectorState();
}

class ImageCollectorState extends State<ImageCollector> {
  String url = '';
  late GlobalKey keyImage;

  late bool showBackground;
  late BoxFit boxFit;
  late Color? color;
  late Color? colorPlaceholder;

  var a;

  @override
  void initState() {
    super.initState();

    keyImage = GlobalKey();

    url = widget.imageUrl;

    showBackground = widget.showBackground;
    boxFit = widget.boxFit;
    color = widget.color;
    colorPlaceholder = widget.colorPlaceholder;
  }

  @override
  void didUpdateWidget(covariant ImageCollector oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.imageUrl != widget.imageUrl) url = widget.imageUrl;
    if (oldWidget.showBackground != widget.showBackground) {
      showBackground = widget.showBackground;
    }
    if (oldWidget.boxFit != widget.boxFit) boxFit = widget.boxFit;
    if (oldWidget.color != widget.color) color = widget.color;
    if (oldWidget.colorPlaceholder != widget.colorPlaceholder) {
      colorPlaceholder = widget.colorPlaceholder;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (url == '') {
      return widget.placeholder ??
          Image.asset(
            'assets/images/banner/dummy-image.jpg',
            fit: BoxFit.cover,
            color: colorPlaceholder,
          );
    } else {
      return CachedNetworkImage(
        imageUrl: url,
        fit: BoxFit.cover,
        filterQuality: FilterQuality.medium,
        progressIndicatorBuilder: (context, url, progress) {
          return Container(
            decoration: (showBackground)
                ? const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/banner/dummy-image.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                  )
                : const BoxDecoration(),
            height: 20,
            width: 20,
            // child: const Center(
            //   child: CircularProgressIndicator(
            //     strokeWidth: 2,
            //   ),
            // ),
          );
        },
        color: color,
        errorWidget: (context, url, error) {
          return widget.placeholder ??
              Image.asset(
                'assets/images/banner/dummy-image.jpg',
                fit: BoxFit.cover,
                color: colorPlaceholder,
              );
        },
      );
    }
  }
}
