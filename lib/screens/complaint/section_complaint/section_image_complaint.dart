import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:integra_mobile/layout/padding.dart';
import 'package:integra_mobile/layout/row.dart';
import 'package:integra_mobile/value/path_image.dart';
import 'package:integra_mobile/value/theme.dart';

class SectionImageComplaint extends StatefulWidget {
  const SectionImageComplaint({
    super.key,
  });

  @override
  State<SectionImageComplaint> createState() => _SectionImageComplaintState();
}

class _SectionImageComplaintState extends State<SectionImageComplaint> {
  File? file;
  bool isFile = false;
  void takeImageWithCamera() async {
    XFile? xFileImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    File image = File(xFileImage!.path);
    Navigator.of(context).pop();
    setState(() {
      file = image;
      isFile = true;
    });
  }

  void takeImageWithGallery() async {
    XFile? xFileImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    File image = File(xFileImage!.path);
    Navigator.of(context).pop();
    setState(() {
      file = image;
      isFile = true;
    });
  }

  void cencel() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          context: context,
          builder: (BuildContext context) {
            return SizedBox(
              height: 150,
              child: Padding(
                padding: paddingMobile,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 4,
                        width: 40,
                        color: darkGrey,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Select your complaint file',
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: black,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                      const SizedBox(height: 20),
                      IRow(
                        gap: 10,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryGreen,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: takeImageWithCamera,
                              child: IRow(
                                mainAxisAlignment: MainAxisAlignment.center,
                                gap: 5,
                                children: [
                                  const Icon(
                                    Icons.camera,
                                    color: white,
                                  ),
                                  Text(
                                    'Camera',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(
                                          color: white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryGreen,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: takeImageWithGallery,
                              child: IRow(
                                mainAxisAlignment: MainAxisAlignment.center,
                                gap: 5,
                                children: [
                                  const Icon(
                                    Icons.photo,
                                    color: white,
                                  ),
                                  Text(
                                    'Gallery',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(
                                          color: white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
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
                        file!,
                        width: 345,
                        height: 250,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(pathImageUpload)),
          )),
    );
  }
}
