import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:integra_mobile/app/config/theme.dart';
import 'package:integra_mobile/app/validations/validations.dart';
import 'package:integra_mobile/share/widget/button/button_solid_green.dart';
import 'package:integra_mobile/share/widget/mocullar/bottom_sheet/bloc/bloc_reset_password.dart';
import 'package:integra_mobile/share/widget/mocullar/form/form_input.dart';

class BottomDialogFogotPassword extends StatefulWidget {
  const BottomDialogFogotPassword({super.key});

  @override
  State<BottomDialogFogotPassword> createState() =>
      _BottomDialogFogotPasswordState();
}

class _BottomDialogFogotPasswordState extends State<BottomDialogFogotPassword> {
  final _formSignInKey = GlobalKey<FormState>();
  bool rememberPassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlocResetPassword(context.read()),
      child: BlocListener<BlocResetPassword, BlocResetPasswordState>(
        listener: (context, state) {
          if (state.status.isFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(const SnackBar(
                  behavior: SnackBarBehavior.floating,
                  content: Text(
                      "Email salah dan tidak bisa mengirimkan email ke email kamu")));
          }

          if (state.status.isSuccess) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(const SnackBar(
                  behavior: SnackBarBehavior.floating,
                  content: Text(
                      "Berhasil mengirimkan email reset password silahkan cek di email kamu")));

            Navigator.pop(context);
          }
        },
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
              child: Form(
                key: _formSignInKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Forgot Password",
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(
                              color: darkblue, fontWeight: FontWeight.w800),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Please enter your email and we will send \nyou link to return your account",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: darkGrey, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 40.0),
                    BlocBuilder<BlocResetPassword, BlocResetPasswordState>(
                        buildWhen: (previous, current) =>
                            previous.email != current.email,
                        builder: (context, state) {
                          return MyFormInput(
                            onChanged: (value) {
                              context.read<BlocResetPassword>().add(
                                  BlocResetPasswordChangeEmail(email: value));
                            },
                            labelText: "Email",
                            hintText: 'Enter Your Email',
                            errorText: state.email.isPure
                                ? null
                                : state.email.error?.text,
                          );
                        }),
                    const SizedBox(height: 25.0),
                    BlocBuilder<BlocResetPassword, BlocResetPasswordState>(
                        builder: (context, state) {
                      if (state.status.isInProgress) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      return SizedBox(
                        height: 40,
                        width: double.infinity,
                        child: ButtonSolidGreen(
                          ontap: () {
                            context
                                .read<BlocResetPassword>()
                                .add(BlocResetPasswordSend());
                          },
                          title: "Forgot Password",
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
