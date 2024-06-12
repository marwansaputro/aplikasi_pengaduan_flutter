import 'package:flutter/material.dart';
import 'package:integra_mobile/app/config/theme.dart';
import 'package:integra_mobile/layout/padding.dart';
import 'package:integra_mobile/share/widget/button/button_solid_green.dart';

class BottomSheetChangeName extends StatelessWidget {
  const BottomSheetChangeName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Padding(
        padding: paddingMobile,
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Change Name',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: black,
                      fontWeight: FontWeight.w500,
                    ),
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                maxLines: 1,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: primaryGreen),
                  ),
                  hintText: "Marwan Saputro",
                  hintStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: black,
                        fontWeight: FontWeight.w400,
                      ),
                  labelText: "Name",
                  labelStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: darkGrey,
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: ButtonSolidGreen(
                  title: 'Save',
                  ontap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
