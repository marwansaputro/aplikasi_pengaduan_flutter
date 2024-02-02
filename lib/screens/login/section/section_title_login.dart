import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:integra_mobile/layout/column.dart';
import 'package:integra_mobile/layout/padding.dart';
import 'package:integra_mobile/layout/row.dart';
import 'package:integra_mobile/value/theme.dart';

class SectionTitleLogin extends StatefulWidget {
  const SectionTitleLogin({super.key});

  @override
  State<SectionTitleLogin> createState() => _SectionTitleLoginState();
}

class _SectionTitleLoginState extends State<SectionTitleLogin> {
  TextEditingController countrycode = TextEditingController();
  @override
  void initState() {
    countrycode.text = "+62";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingMobile,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: IColumn(
          gap: 10,
          children: [
            const Text(
              "Phone Verification",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Text(
              "We need to register your phone without getting started!",
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(8)),
              child: IRow(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(
                      width: 100,
                      child: CountryCodePicker(
                        onChanged: print,
                        initialSelection: 'IT',
                        favorite: ['+62', 'INA'],
                        textStyle: TextStyle(fontSize: 20),
                        showCountryOnly: false,
                        showOnlyCountryWhenClosed: false,
                        alignLeft: false,
                      )),
                  Text(
                    "|",
                    style: TextStyle(fontSize: 33, color: Colors.grey),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: TextField(
                    keyboardType: TextInputType.phone,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Phone Number",
                        hintStyle: TextStyle(fontSize: 20, color: darkGrey)),
                  ))
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: primaryGreen,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  onPressed: () {
                    Navigator.pushNamed(context, 'verify');
                  },
                  child: const Text("Send the code")),
            ),
          ],
        ),
      ),
    );
  }
}
