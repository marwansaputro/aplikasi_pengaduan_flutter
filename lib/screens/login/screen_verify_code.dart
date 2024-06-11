import 'package:flutter/material.dart';
import 'package:integra_mobile/layout/column.dart';
import 'package:integra_mobile/layout/padding.dart';
import 'package:integra_mobile/app/config/theme.dart';
import 'package:pinput/pinput.dart';

class ScreenVerifyCode extends StatelessWidget {
  const ScreenVerifyCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: black),
      ),
      body: const BodyVerifyCode(),
    );
  }
}

class BodyVerifyCode extends StatelessWidget {
  const BodyVerifyCode({super.key});

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
              "OTP",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(color: darkblue, fontWeight: FontWeight.w600),
            ),
            Text(
              "Enter the OTP code that we sent to\nyour cellphone number",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: darkGrey, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            Pinput(
              length: 6,

              // defaultPinTheme: defaultPinTheme,
              // focusedPinTheme: focusedPinTheme,
              // submittedPinTheme: submittedPinTheme,

              showCursor: true,
              onCompleted: (pin) => print(pin),
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
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => BottomNavBar()),
                  // );
                },
                child: Text(
                  "Send the code",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: white, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                // Navigator.pushNamedAndRemoveUntil(
                //   context,
                //   'phone',
                //   (route) => false,
                // );
              },
              child: Text(
                "Edit Phone Number ?",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: primaryGreen,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
