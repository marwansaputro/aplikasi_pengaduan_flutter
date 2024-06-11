import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:integra_mobile/app/config/theme.dart';
import 'package:integra_mobile/bloc/bloc_reset_password.dart';

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
    return BlocListener<BlocResetPassword, BlocResetPasswordState>(
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
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
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
                        return TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Email';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            context.read<BlocResetPassword>().add(
                                BlocResetPasswordChangeEmail(email: value));
                          },
                          decoration: InputDecoration(
                            label: const Text(
                              'Email',
                            ),
                            hintText: 'Enter Your Email',
                            hintStyle: const TextStyle(
                              color: Colors.black26,
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.black12, // Default border color
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.black12, // Default border color
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
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
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: primaryGreen,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {
                          context
                              .read<BlocResetPassword>()
                              .add(BlocResetPasswordSend());
                        },
                        child: Text(
                          "Forgot Password",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                  color: white, fontWeight: FontWeight.w400),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
