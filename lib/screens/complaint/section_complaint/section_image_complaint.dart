import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:integra_mobile/app/config/app_constant.dart';
import 'package:integra_mobile/share/widget/mocullar/bottom_sheet/bottom_sheet_change_image.dart';

class SectionImageComplaint extends StatefulWidget {
  const SectionImageComplaint({
    super.key,
    this.changeImage,
    this.errorText,
  });

  final void Function(File? fileImage)? changeImage;
  final String? errorText;

  @override
  State<SectionImageComplaint> createState() => _SectionImageComplaintState();
}

class _SectionImageComplaintState extends State<SectionImageComplaint> {
  File? _file;
  bool isFile = false;

  String? errorText;

  set file(File? file) {
    _file = file;
    isFile = file != null;

    widget.changeImage?.call(_file);
  }

  @override
  void initState() {
    super.initState();

    errorText = widget.errorText;
  }

  @override
  void didUpdateWidget(covariant SectionImageComplaint oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.errorText != widget.errorText) {
      errorText = widget.errorText;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showBottomSheet(
          context: context,
          builder: (context) {
            return BottomSheetChangeImage(
              onImagePick: (image) {
                file = image;

                Navigator.of(context).pop();
              },
            );
          },
        );
      },
      child: Column(
        children: [
          DottedBorder(
              color: errorText != null ? Colors.red : Colors.blue,
              strokeWidth: 2,
              dashPattern: const [8, 4],
              borderType: BorderType.RRect,
              radius: const Radius.circular(12),
              child: Container(
                width: 345,
                height: 250,
                alignment: Alignment.center,
                child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: isFile
                        ? Image.file(
                            _file!,
                            width: 345,
                            height: 250,
                            fit: BoxFit.cover,
                          )
                        : Image.asset(pathImageUpload)),
              )),
          if (errorText != null)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                errorText ?? '',
                style: const TextStyle(color: Colors.red),
              ),
            )
        ],
      ),
    );
  }
}
