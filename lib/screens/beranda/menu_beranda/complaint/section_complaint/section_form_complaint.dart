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
    return Container(
      padding: paddingMobile,
      child: Column(
        children: <Widget>[
          Text(
            "Complaint Now",
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(color: darkblue, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          Text(
            "Please complete the form below",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: darkGrey, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 50,
          ),
          IColumn(
            gap: 10,
            children: [
              TextFormField(
                maxLines: 1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryGreen),
                  ),
                  hintText: "Enter the name application",
                  hintStyle: TextStyle(color: darkGrey),
                  labelText: "App Name",
                  labelStyle: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: darkblue, fontWeight: FontWeight.w500),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
              TextFormField(
                maxLines: 1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryGreen),
                  ),
                  hintText: "Enter name of Company/Office",
                  hintStyle: TextStyle(color: darkGrey),
                  labelText: "Company/Office",
                  labelStyle: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: darkblue, fontWeight: FontWeight.w500),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
              TextFormField(
                maxLines: 5,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryGreen),
                  ),
                  hintText: "Type your complaint",
                  hintStyle: TextStyle(color: darkGrey),
                  labelText: "Complaint",
                  labelStyle: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: darkblue, fontWeight: FontWeight.w500),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
