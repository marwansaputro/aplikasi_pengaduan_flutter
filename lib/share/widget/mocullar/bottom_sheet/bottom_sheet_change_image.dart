import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:integra_mobile/app/config/theme.dart';
import 'package:integra_mobile/layout/padding.dart';
import 'package:integra_mobile/layout/row.dart';

class BottomSheetChangeImage extends StatelessWidget {
  const BottomSheetChangeImage({super.key, required this.onImagePick});

  final void Function(File image) onImagePick;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Padding(
        padding: paddingMobile,
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 5,
                width: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: primaryGrey,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Select a profile photo',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
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
                      onPressed: () {
                        _pickImageFromCamera();
                      },
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
                      onPressed: () {
                        _pickImageFromGallery();
                      },
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
  }

  //Gallery
  Future _pickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;

    onImagePick(File(returnImage.path));

    // setState(() {
    //   selectedImage = File(returnImage.path);
    //   _image = File(returnImage.path).readAsBytesSync();
    // });
    // Navigator.of(context).pop();
  }

  //Camera
  Future _pickImageFromCamera() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;

    onImagePick(File(returnImage.path));

    // setState(() {
    //   selectedImage = File(returnImage.path);
    //   _image = File(returnImage.path).readAsBytesSync();
    // });
    // Navigator.of(context).pop();
  }
}
