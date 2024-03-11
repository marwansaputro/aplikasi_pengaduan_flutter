// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:integra_mobile/layout/column.dart';
import 'package:integra_mobile/layout/padding.dart';
import 'package:integra_mobile/layout/row.dart';
import 'package:integra_mobile/value/path_image.dart';
import 'package:integra_mobile/value/theme.dart';

class SectionFormComplaint extends StatelessWidget {
  const SectionFormComplaint({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          pathImageOrnamen2,
          fit: BoxFit.cover,
        ),
        Column(
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Text(
              "Complaint Now",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(color: darkblue, fontWeight: FontWeight.w800),
              textAlign: TextAlign.center,
            ),
            Text(
              "Please complete the form below",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: darkGrey, fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40.0,
            ),
            Padding(
              padding: paddingMobile,
              child: Container(
                height: 600,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: white,
                  boxShadow: [
                    BoxShadow(
                        color: Theme.of(context)
                            .colorScheme
                            .shadow
                            .withOpacity(0.10),
                        blurRadius: 15,
                        spreadRadius: -15,
                        offset: const Offset(0, 25)),
                  ],
                ),
                child: Padding(
                  padding: paddingMobile,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: SingleChildScrollView(
                      child: IColumn(
                        gap: 15,
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter App Name';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: "Enter the name application",
                              hintStyle: TextStyle(color: darkGrey),
                              labelText: "App Name",
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                      color: darkblue,
                                      fontWeight: FontWeight.w500),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black12,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black12,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Company/Office';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: "Enter name of Company/Office",
                              hintStyle: TextStyle(color: darkGrey),
                              labelText: "Company/Office",
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                      color: darkblue,
                                      fontWeight: FontWeight.w500),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black12,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black12,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          TextFormField(
                            // validator: (value) {
                            //   if (value == null || value.isEmpty) {
                            //     return 'Please enter your Complaint';
                            //   }
                            //   return null;
                            // },
                            maxLines: 5,
                            decoration: InputDecoration(
                              hintText: "Type your complaint",
                              hintStyle: TextStyle(color: darkGrey),
                              labelText: "Complaint",
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                      color: darkblue,
                                      fontWeight: FontWeight.w500),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black12,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black12,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
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
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          primaryGreen,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      // takePhoto(ImageSource.camera);
                                                    },
                                                    child: IRow(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      gap: 5,
                                                      children: [
                                                        const Icon(
                                                          Icons.camera,
                                                          color: white,
                                                        ),
                                                        Text(
                                                          'Camera',
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .titleLarge
                                                                  ?.copyWith(
                                                                    color:
                                                                        white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          primaryGreen,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      // takePhoto(ImageSource.gallery);
                                                    },
                                                    child: IRow(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      gap: 5,
                                                      children: [
                                                        const Icon(
                                                          Icons.photo,
                                                          color: white,
                                                        ),
                                                        Text(
                                                          'Gallery',
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .titleLarge
                                                                  ?.copyWith(
                                                                    color:
                                                                        white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
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
                                radius: Radius.circular(12),
                                child: Container(
                                  width: 345,
                                  height: 250,
                                  alignment: Alignment.center,
                                  child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Image.asset(
                                        pathImageUpload,
                                      )),
                                )),
                          ),
                          SizedBox(height: 10),
                          SizedBox(
                            height: 40,
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: primaryGreen,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              onPressed: () {},
                              child: Text(
                                "Submit",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                        color: white,
                                        fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
