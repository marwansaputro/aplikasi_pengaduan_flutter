import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:integra_mobile/app/config/app_constant.dart';
import 'package:integra_mobile/share/widget/mocullar/bottom_sheet/bottom_sheet_change_image.dart';

class SectionImageComplaint extends StatefulWidget {
  const SectionImageComplaint({
    super.key,
    this.changeImage,
  });

  final void Function(File? fileImage)? changeImage;

  @override
  State<SectionImageComplaint> createState() => _SectionImageComplaintState();
}

class _SectionImageComplaintState extends State<SectionImageComplaint> {
  File? _file;
  bool isFile = false;

  set file(File? file) {
    _file = file;
    isFile = file != null;

    widget.changeImage?.call(_file);
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
      child: DottedBorder(
          color: Colors.blue,
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
    );
  }
}
