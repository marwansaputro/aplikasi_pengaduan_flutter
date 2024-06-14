import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:integra_mobile/app/validations/validations.dart';
import 'package:integra_mobile/bloc/bloc.dart';
import 'package:integra_mobile/share/widget/button/button_solid_green.dart';
import 'package:integra_mobile/share/widget/mocullar/bottom_sheet/bloc/bloc_form_registration.dart';
import 'package:integra_mobile/app/config/theme.dart';
import 'package:integra_mobile/share/widget/atomic/label.dart';
import 'package:integra_mobile/share/widget/mocullar/form/form_input.dart';

class BottomDialogSignUp extends StatefulWidget {
  const BottomDialogSignUp({
    super.key,
    this.signInOnClick,
  });

  final void Function()? signInOnClick;

  @override
  State<BottomDialogSignUp> createState() => _BottomDialogSignUpState();
}

class _BottomDialogSignUpState extends State<BottomDialogSignUp> {
  final _formSignupKey = GlobalKey<FormState>();
  bool agreePersonalData = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FormRegisterBloc(userRepository: context.read()),
      child: BlocListener<FormRegisterBloc, FormRegisterBlocState>(
        listener: (context, state) {
          if (state.status.isFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(const SnackBar(
                  behavior: SnackBarBehavior.floating,
                  content: Text("Tidak bisa mendaftarkan peserta berikut")));
          }

          if (state.status.isSuccess) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(const SnackBar(
                  behavior: SnackBarBehavior.floating,
                  content: Text("Berhasil mendaftarkan peserta")));

            Navigator.pop(context);
          }
        },
        child: Container(
          padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
          child: Form(
            key: _formSignupKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const MyHeadlineTitle("Get Started",
                    color: darkblue, textStyle: MyTextStyle.medium),
                const MyLabelTitle("Complete your details or continue",
                    color: darkGrey, textStyle: MyTextStyle.medium),
                const SizedBox(height: 40.0),
                _nameField(),
                const SizedBox(height: 25.0),
                _emailField(),
                const SizedBox(height: 25.0),
                _passwordField(),
                const SizedBox(height: 25.0),
                Row(
                  children: [
                    Checkbox(
                      value: agreePersonalData,
                      onChanged: (bool? value) {
                        setState(() {
                          agreePersonalData = value!;
                        });
                      },
                      activeColor: primaryGreen,
                    ),
                    const Text(
                      'I agree to the processing of ',
                      style: TextStyle(
                        color: Colors.black45,
                      ),
                    ),
                    const Text(
                      'Personal data',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: darkblue,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25.0),

                SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: _buttonSignUp(),
                ),
                const SizedBox(height: 30.0),

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
                //   height: 30.0,
                // ),
                // sign up social media logo
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account? ',
                      style: TextStyle(
                        color: Colors.black45,
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.signInOnClick,
                      child: const Text(
                        'Sign in',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: primaryGreen,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BlocBuilder<FormRegisterBloc, FormRegisterBlocState> _buttonSignUp() {
    return BlocBuilder<FormRegisterBloc, FormRegisterBlocState>(
        builder: (context, state) {
      if (state.status.isInProgress) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      return ButtonSolidGreen(
        ontap: () {
          context
              .read<FormRegisterBloc>()
              .add(FormRegisterActionRegistration());
        },
        title: "Sign Up",
      );
    });
  }

  Widget _passwordField() {
    return BlocBuilder<FormRegisterBloc, FormRegisterBlocState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return MyFormInput(
          obscureText: true,
          obscuringCharacter: '*',
          onChanged: (value) {
            context
                .read<FormRegisterBloc>()
                .add(FormRegistrationChangePassword(password: value));
          },
          labelText: "Password",
          hintText: 'Enter Your Password',
          errorText: state.password.displayError != null
              ? state.password.error?.text
              : null,
        );
      },
    );
  }

  Widget _emailField() {
    return BlocBuilder<FormRegisterBloc, FormRegisterBlocState>(
        buildWhen: (previous, current) => previous.email != current.email,
        builder: (context, state) {
          return MyFormInput(
            onChanged: (value) {
              context
                  .read<FormRegisterBloc>()
                  .add(FormRegistrationChangeEmail(email: value));
            },
            errorText: state.email.displayError != null
                ? state.email.error?.text
                : null,
            labelText: 'Email',
            hintText: 'Enter Your Email',
          );
        });
  }

  Widget _nameField() {
    return BlocBuilder<FormRegisterBloc, FormRegisterBlocState>(
        buildWhen: (previous, current) => previous.name != current.name,
        builder: (context, state) {
          return MyFormInput(
            onChanged: (value) {
              context
                  .read<FormRegisterBloc>()
                  .add(FormRegistrationChangeName(name: value));
            },
            labelText: 'Full Name',
            hintText: 'Enter Your Full Name',
            errorText:
                state.name.displayError != null ? state.name.error?.text : null,
          );
        });
  }
}
