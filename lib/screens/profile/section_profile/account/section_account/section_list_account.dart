import 'package:flutter/material.dart';
import 'package:integra_mobile/layout/column.dart';
import 'package:integra_mobile/layout/padding.dart';
import 'package:integra_mobile/app/config/theme.dart';
import 'package:integra_mobile/screens/profile/section_profile/account/section_account/bottom_sheet/bottom_sheet_change_handphone.dart';
import 'package:integra_mobile/screens/profile/section_profile/account/section_account/bottom_sheet/bottom_sheet_change_name.dart';
import 'package:integra_mobile/screens/profile/section_profile/account/section_account/bottom_sheet/bottom_sheet_change_password.dart';
import 'package:integra_mobile/share/widget/mocullar/form/form_input.dart';

class SectionListAccount extends StatefulWidget {
  const SectionListAccount({super.key});

  @override
  State<SectionListAccount> createState() => _SectionListAccountState();
}

class _SectionListAccountState extends State<SectionListAccount> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingMobile,
      child: IColumn(
        gap: 15,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: MyFormInput(
              labelText: "Name",
              hintText: "Marwan Saputro",
              suffixIcon: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: primaryGreen, // foreground
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return Padding(
                        padding: MediaQuery.of(context).viewInsets,
                        child: BottomSheetChangeName(),
                      );
                    },
                  );
                },
                child: Text(
                  'Edit',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: primaryGreen,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
            ),
          ),
          MyFormInput(
            hintText: "087838653826",
            labelText: "No. Handphone",
            suffixIcon: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: primaryGreen, // foreground
              ),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Padding(
                        padding: MediaQuery.of(context).viewInsets,
                        child: BottomSheetChangeHandphone());
                  },
                );
              },
              child: Text(
                'Edit',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: primaryGreen,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
          ),
          MyFormInput(
            hintText: "**************",
            labelText: "Password",
            suffixIcon: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: primaryGreen, // foreground
              ),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return BottomSheetChangePassword();
                  },
                );
              },
              child: Text(
                'Edit',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: primaryGreen,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
