import 'package:flutter/material.dart';
import 'package:integra_mobile/layout/padding.dart';
import 'package:integra_mobile/layout/row.dart';
import 'package:integra_mobile/value/path_image.dart';
import 'package:integra_mobile/value/theme.dart';

class SectionPictureProfile extends StatelessWidget {
  const SectionPictureProfile({super.key});

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
                backgroundImage: AssetImage(pathImageDummyProfile),
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
                          return Container(
                            height: 200,
                            child: Padding(
                              padding: paddingMobile,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Select a profile photo',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(
                                            color: black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    SizedBox(height: 50),
                                    IRow(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      gap: 50,
                                      children: [
                                        IRow(
                                          gap: 5,
                                          children: [
                                            Icon(Icons.camera),
                                            Text(
                                              'Take Photo',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge
                                                  ?.copyWith(
                                                    color: black,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ],
                                        ),
                                        IRow(
                                          gap: 5,
                                          children: [
                                            Icon(Icons.photo),
                                            Text(
                                              'Gallery',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge
                                                  ?.copyWith(
                                                    color: black,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),

                                    // Center(
                                    //   child: ButtonSolidGreen(
                                    //     title: 'Save',
                                    //     ontap: () {
                                    //       Navigator.pop(context);
                                    //     },
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                      // showDialog(
                      //     context: context,
                      //     builder: (BuildContext context) {
                      //       return AlertDialog(
                      //         // scrollable: true,
                      //         shape: RoundedRectangleBorder(
                      //             borderRadius: BorderRadius.circular(12)),
                      //         contentPadding: const EdgeInsets.all(10),
                      //         content: Container(
                      //           width: 400,
                      //           height: 50,
                      //           child: Text(
                      //             'Select a profile photo',
                      //             textAlign: TextAlign.center,
                      //             style: Theme.of(context)
                      //                 .textTheme
                      //                 .titleLarge
                      //                 ?.copyWith(
                      //                     color: black,
                      //                     fontWeight: FontWeight.w500),
                      //           ),
                      //         ),
                      //       );
                      //     });
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
