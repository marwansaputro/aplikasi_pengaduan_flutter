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
            style: TextStyle(
                fontSize: 32, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Text(
            "Please complete the form below",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black54,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 30,
          ),
          IColumn(
            gap: 15,
            children: [
              TextFormField(
                maxLines: 1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryGreen),
                  ),
                  hintText: "Enter the name application",
                  hintStyle: TextStyle(color: Colors.black26),
                  labelText: "App Name",
                  labelStyle: TextStyle(
                      color: Colors.black87,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
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
                  hintStyle: TextStyle(color: Colors.black26),
                  labelText: "Company/Office",
                  labelStyle: TextStyle(
                      color: Colors.black87,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
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
                  hintStyle: TextStyle(color: Colors.black26),
                  labelText: "Complaint",
                  labelStyle: TextStyle(
                      color: Colors.black87,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
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
