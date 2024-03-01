// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:integra_mobile/layout/column.dart';
import 'package:integra_mobile/layout/padding.dart';
import 'package:integra_mobile/value/theme.dart';

class SectionFormComplaint extends StatelessWidget {
  const SectionFormComplaint({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
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
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: white,
              boxShadow: [
                BoxShadow(
                    color:
                        Theme.of(context).colorScheme.shadow.withOpacity(0.10),
                    blurRadius: 15,
                    spreadRadius: -15,
                    offset: const Offset(0, 25)),
              ],
            ),
            child: Padding(
              padding: paddingMobile,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: IColumn(
                  gap: 15,
                  children: [
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
                                color: darkblue, fontWeight: FontWeight.w500),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
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
                                color: darkblue, fontWeight: FontWeight.w500),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
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
                                color: darkblue, fontWeight: FontWeight.w500),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
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
                    SizedBox(height: 20),
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
                                  color: white, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
