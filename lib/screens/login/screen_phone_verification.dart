import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:integra_mobile/layout/column.dart';
import 'package:integra_mobile/layout/padding.dart';
import 'package:integra_mobile/layout/row.dart';
import 'package:integra_mobile/screens/login/screen_verify_code.dart';
import 'package:integra_mobile/app/config/theme.dart';

class ScreenPhoneVerification extends StatefulWidget {
  const ScreenPhoneVerification({super.key});

  @override
  State<ScreenPhoneVerification> createState() =>
      _ScreenPhoneVerificationState();
}

class _ScreenPhoneVerificationState extends State<ScreenPhoneVerification> {
  final List<String?> errors = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // actions: [
        //   IColumn(
        //     gap: 10,
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Text(
        //         "Phone Verification",
        //         style: Theme.of(context)
        //             .textTheme
        //             .headlineMedium
        //             ?.copyWith(color: black, fontWeight: FontWeight.w600),
        //       ),
        //       Text(
        //         "We need to register your phone without\ngetting started!",
        //         style: Theme.of(context)
        //             .textTheme
        //             .titleLarge
        //             ?.copyWith(color: darkGrey, fontWeight: FontWeight.w500),
        //         textAlign: TextAlign.center,
        //       ),
        //     ],
        //   ),
        // ],
        backgroundColor: Colors.transparent,

        elevation: 0,
        // iconTheme: const IconThemeData(color: black),
      ),
      body: const BodyPhoneVerification(),
    );
  }
}

class BodyPhoneVerification extends StatefulWidget {
  const BodyPhoneVerification({super.key});

  @override
  State<BodyPhoneVerification> createState() => _BodyPhoneVerificationState();
}

class _BodyPhoneVerificationState extends State<BodyPhoneVerification> {
  String? username;
  String? password;
  bool? remember = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingMobile,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: IColumn(
          gap: 10,
          children: [
            Text(
              "INTEGRA Mobile!",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(color: darkblue, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            Text(
              "Please log in with your mobile number",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: darkGrey, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: darkGrey,
                  ),
                  borderRadius: BorderRadius.circular(8)),
              child: IRow(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 100,
                      child: CountryCodePicker(
                        onChanged: print,
                        initialSelection: 'IT',
                        favorite: const ['+62', 'INA'],
                        textStyle: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(
                                color: black, fontWeight: FontWeight.w400),
                        showCountryOnly: false,
                        showOnlyCountryWhenClosed: false,
                        alignLeft: false,
                      )),
                  Text(
                    "|",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: darkGrey, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                      child: TextField(
                    keyboardType: TextInputType.phone,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: black, fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Phone Number",
                      hintStyle: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(
                              color: primaryGrey, fontWeight: FontWeight.w500),
                    ),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ScreenVerifyCode()),
                  );
                  // Navigator.pushNamed(context, 'screen_verify_code');
                },
                child: Text(
                  "Verify Phone Number",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: white, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Sign in using another method',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: primaryGreen,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            // Row(
            //   children: [
            //     Checkbox(
            //       value: remember,
            //       activeColor: Colors.green,
            //       onChanged: (value) {
            //         setState(() {
            //           remember = value;
            //         });
            //       },
            //     ),
            //     const Text("Remember Me"),

            //     // TextButton(
            //     //   style: TextButton.styleFrom(
            //     //     foregroundColor: Colors.black54, // foreground
            //     //   ),
            //     //   onPressed: () {
            //     //     // Navigator.push(
            //     //     //   context,
            //     //     //   MaterialPageRoute(
            //     //     //       builder: (context) => const ScreenForgotPassword()),
            //     //     // );
            //     //   },
            //     //   child: const Text(
            //     //     'Forgot Password',
            //     //     style: TextStyle(
            //     //         decoration: TextDecoration.underline,
            //     //         color: Colors.blue),
            //     //   ),
            //     // ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
