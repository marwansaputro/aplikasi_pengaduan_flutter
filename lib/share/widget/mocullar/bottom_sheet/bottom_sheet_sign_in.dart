import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:integra_mobile/app/validations/validations.dart';
import 'package:integra_mobile/bloc/bloc.dart';
import 'package:integra_mobile/layout/row.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integra_mobile/app/config/theme.dart';
import 'package:integra_mobile/share/widget/atomic/label.dart';
import 'package:integra_mobile/share/widget/button/button_solid_green.dart';
import 'package:integra_mobile/share/widget/mocullar/form/form_input.dart';

class BottomDialogSignIn extends StatefulWidget {
  const BottomDialogSignIn({
    super.key,
    this.signUpOnClick,
    this.forgotPasswordOnClick,
  });

  final void Function()? signUpOnClick;
  final void Function()? forgotPasswordOnClick;

  @override
  State<BottomDialogSignIn> createState() => _BottomDialogSignInState();
}

class _BottomDialogSignInState extends State<BottomDialogSignIn> {
  final _formSignInKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlocFormLogin(userRepository: context.read()),
      child: BlocListener<BlocFormLogin, BlocFormLoginState>(
        listener: (context, state) {
          if (state.status.isFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(const SnackBar(
                  behavior: SnackBarBehavior.floating,
                  content: Text("Tidak bisa login di akun ini")));
          }

          if (state.status.isSuccess) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(const SnackBar(
                  behavior: SnackBarBehavior.floating,
                  content: Text("Berhasil login di akun peserta")));

            Navigator.pop(context);
          }
        },
        child: Container(
          padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
          child: Form(
            key: _formSignInKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const MyHeadlineTitle("Welcome Back",
                    color: darkblue, textStyle: MyTextStyle.large),
                const MyLabelTitle("Sign in with your email and password",
                    color: darkGrey, textStyle: MyTextStyle.medium),
                const SizedBox(height: 40.0),
                _usernameInput(context),
                const SizedBox(height: 25.0),
                _passwordInput(context),
                const SizedBox(height: 25.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _rememberMe(),
                    _forgetPassword(),
                  ],
                ),
                const SizedBox(height: 25.0),
                SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: _buttonSignIn(),
                ),
                const SizedBox(height: 25.0),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Expanded(
                //       child: Divider(
                //         thickness: 0.7,
                //         color: Colors.grey.withOpacity(0.5),
                //       ),
                //     ),
                //     const Padding(
                //       padding: EdgeInsets.symmetric(
                //         vertical: 0,
                //         horizontal: 10,
                //       ),
                //       child: Text(
                //         'Sign up with',
                //         style: TextStyle(
                //           color: Colors.black45,
                //         ),
                //       ),
                //     ),
                //     Expanded(
                //       child: Divider(
                //         thickness: 0.7,
                //         color: Colors.grey.withOpacity(0.5),
                //       ),
                //     ),
                //   ],
                // ),
                // const SizedBox(
                //   height: 25.0,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     Logo(Logos.facebook_f),
                //     Logo(Logos.twitter),
                //     Logo(Logos.google),
                //     Logo(Logos.apple),
                //   ],
                // ),
                // const SizedBox(
                //   height: 25.0,
                // ),
                // don't have an account
                _signUp(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  IRow _signUp(BuildContext context) {
    return IRow(
      gap: 5,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Don\'t have an account? ',
          style: TextStyle(
            color: Colors.black45,
          ),
        ),
        GestureDetector(
          onTap: widget.signUpOnClick,
          child: const Text(
            'Sign Up',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: primaryGreen,
            ),
          ),
        ),
      ],
    );
  }

  GestureDetector _forgetPassword() {
    return GestureDetector(
      onTap: widget.forgotPasswordOnClick,
      child: const Text(
        'Forget password?',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: darkblue,
        ),
      ),
    );
  }

  Widget _rememberMe() {
    return BlocBuilder<BlocFormLogin, BlocFormLoginState>(
        buildWhen: (previous, current) =>
            previous.rememberMe != current.rememberMe,
        builder: (context, state) {
          return Row(
            children: [
              Checkbox(
                value: state.rememberMe.value,
                onChanged: (bool? value) {
                  context.read<BlocFormLogin>().add(
                      BlocFormLoginEventChangeRememberMe(
                          rememberMe: value ?? false));
                },
                activeColor: primaryGreen,
              ),
              const Text(
                'Remember me',
                style: TextStyle(
                  color: Colors.black45,
                ),
              ),
            ],
          );
        });
  }

  Widget _buttonSignIn() {
    return BlocBuilder<BlocFormLogin, BlocFormLoginState>(
        builder: (context, state) {
      if (state.status.isInProgress) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      return ButtonSolidGreen(
        ontap: () {
          context.read<BlocFormLogin>().add(BlocFormLoginActionLogin());
        },
        title: "Sign In",
      );
    });
  }

  Widget _passwordInput(BuildContext context) {
    return BlocBuilder<BlocFormLogin, BlocFormLoginState>(
        buildWhen: (previous, current) => previous.password != current.password,
        builder: (context, state) {
          return MyFormInput(
            obscureText: true,
            obscuringCharacter: '*',
            errorText: state.password.isPure == false
                ? state.password.error?.text
                : null,
            onChanged: (value) {
              context
                  .read<BlocFormLogin>()
                  .add(BlocFormLoginEventChangePassword(password: value));
            },
            labelText: "Password",
            hintText: 'Enter Your Password',
          );
        });
  }

  Widget _usernameInput(BuildContext context) {
    return BlocBuilder<BlocFormLogin, BlocFormLoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return MyFormInput(
          onChanged: (value) {
            context
                .read<BlocFormLogin>()
                .add(BlocFormLoginEventChangeEmail(email: value));
          },
          errorText:
              state.email.isPure == false ? state.email.error?.text : null,
          labelText: "Email",
          hintText: 'Enter Your Email',
        );
      },
    );
  }
}
