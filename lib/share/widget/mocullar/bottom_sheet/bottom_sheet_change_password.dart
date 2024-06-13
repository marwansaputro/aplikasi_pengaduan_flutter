import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:integra_mobile/app/config/theme.dart';
import 'package:integra_mobile/app/validations/validations.dart';
import 'package:integra_mobile/layout/padding.dart';
import 'package:integra_mobile/share/widget/button/button_solid_green.dart';
import 'package:integra_mobile/share/widget/mocullar/bottom_sheet/bloc/bloc_user_change_password.dart';
import 'package:integra_mobile/share/widget/mocullar/form/form_input.dart';

class BottomSheetChangePassword extends StatelessWidget {
  const BottomSheetChangePassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          BlocUserChangePassword(userRepository: context.read()),
      child: BlocListener<BlocUserChangePassword, BlocUserChangePasswordState>(
        listener: (context, state) {
          if (state.status.isFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(const SnackBar(
                  behavior: SnackBarBehavior.floating,
                  content: Text("Tidak berhasil merubah password")));
          }

          if (state.status.isSuccess) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(const SnackBar(
                  behavior: SnackBarBehavior.floating,
                  content: Text("Berhasil merubah password user")));

            Navigator.pop(context);
          }
        },
        child: Padding(
          padding: paddingMobile,
          child: Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
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
                const SizedBox(height: 20),
                BlocBuilder<BlocUserChangePassword,
                    BlocUserChangePasswordState>(builder: (context, state) {
                  return MyFormInput(
                    hintText: "Marwan Saputro",
                    labelText: "Password Lama",
                    onChanged: (value) {
                      context.read<BlocUserChangePassword>().add(
                          BlocUserChangePasswordEventChangeOldPassword(
                              password: value));
                    },
                    obscureText: true,
                    errorText: state.oldPassword.isPure == false
                        ? state.oldPassword.error?.text
                        : null,
                  );
                }),
                const SizedBox(height: 20),
                BlocBuilder<BlocUserChangePassword,
                    BlocUserChangePasswordState>(builder: (context, state) {
                  return MyFormInput(
                    hintText: "Marwan Saputro",
                    labelText: "Password New",
                    obscureText: true,
                    onChanged: (value) {
                      context.read<BlocUserChangePassword>().add(
                          BlocUserChangePasswordEventChangeNewPassword(
                              password: value));
                    },
                    errorText: state.newPassword.isPure == false
                        ? state.newPassword.error?.text
                        : null,
                  );
                }),
                const SizedBox(height: 20),
                Center(
                  child: BlocBuilder<BlocUserChangePassword,
                      BlocUserChangePasswordState>(builder: (context, state) {
                    if (state.status.isInProgress) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    return ButtonSolidGreen(
                      title: 'Save',
                      ontap: () {
                        context
                            .read<BlocUserChangePassword>()
                            .add(BlocUserChangePasswordSubmit());
                      },
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
