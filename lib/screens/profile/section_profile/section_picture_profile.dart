import 'package:flutter/material.dart';
import 'package:integra_mobile/layout/padding.dart';
import 'package:integra_mobile/layout/row.dart';
import 'package:integra_mobile/value/theme.dart';

class SectionPictureProfile extends StatefulWidget {
  const SectionPictureProfile({super.key});

  @override
  State<SectionPictureProfile> createState() => _SectionPictureProfileState();
}

class _SectionPictureProfileState extends State<SectionPictureProfile> {
  // PickedFile _imageFile;
  // final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: SizedBox(
          height: 100,
          width: 100,
          child: Stack(
            fit: StackFit.expand,
            clipBehavior: Clip.none,
            children: [
              const CircleAvatar(
                backgroundColor: primaryGreen,
                // backgroundImage: _imageFile == null
                //     ? AssetImage(pathImageDummyProfile)
                //     : FileImage(File(_imageFile.path)),
              ),
              Positioned(
                right: -8.0,
                bottom: 0.0,
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: primaryGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: const BorderSide(color: Colors.white),
                      ),
                      backgroundColor: Colors.white,
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30))),
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
                                      'Select a profile photo',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.copyWith(
                                            color: black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    const SizedBox(height: 20),
                                    IRow(
                                      gap: 10,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: primaryGreen,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                            onPressed: () {
                                              // takePhoto(ImageSource.camera);
                                            },
                                            child: IRow(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
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
                                                        fontWeight:
                                                            FontWeight.w500,
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
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                            onPressed: () {
                                              // takePhoto(ImageSource.gallery);
                                            },
                                            child: IRow(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
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
                                                        fontWeight:
                                                            FontWeight.w500,
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
                    child: const Icon(
                      Icons.camera_alt,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// void takePhoto(ImageSource source) async {
//     final pickedFile = await _picker.getImage(
//       source: source,
//     );
//     setState(() {
//       _imageFile = pickedFile;
//     });
//   }
