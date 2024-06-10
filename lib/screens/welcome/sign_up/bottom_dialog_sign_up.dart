import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:integra_mobile/bloc/bloc.dart';
import 'package:integra_mobile/bloc/bloc_form_registration.dart';
import 'package:integra_mobile/app/config/theme.dart';
import 'package:integra_mobile/share/widget/atomic/label.dart';

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
    return BlocListener<FormRegisterBloc, FormRegisterBlocState>(
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

      return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: primaryGreen,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        onPressed: () {
          context
              .read<FormRegisterBloc>()
              .add(FormRegisterActionRegistration());
        },
        child: Text(
          "Sign Up",
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: white, fontWeight: FontWeight.w500),
        ),
      );
    });
  }

  Widget _passwordField() {
    return BlocBuilder<FormRegisterBloc, FormRegisterBlocState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextFormField(
          obscureText: true,
          obscuringCharacter: '*',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your Password';
            }
            return null;
          },
          onChanged: (value) {
            context
                .read<FormRegisterBloc>()
                .add(FormRegistrationChangePassword(password: value));
          },
          decoration: InputDecoration(
            label: const Text('Password'),
            hintText: 'Enter Your Password',
            hintStyle: const TextStyle(
              color: Colors.black26,
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.black12,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.black12,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      },
    );
  }

  Widget _emailField() {
    return BlocBuilder<FormRegisterBloc, FormRegisterBlocState>(
        buildWhen: (previous, current) => previous.email != current.email,
        builder: (context, state) {
          return TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please your enter Email';
              }
              return null;
            },
            onChanged: (value) {
              context
                  .read<FormRegisterBloc>()
                  .add(FormRegistrationChangeEmail(email: value));
            },
            decoration: InputDecoration(
              label: const Text('Email'),
              hintText: 'Enter Your Email',
              hintStyle: const TextStyle(
                color: Colors.black26,
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.black12,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.black12,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
        });
  }

  Widget _nameField() {
    return BlocBuilder<FormRegisterBloc, FormRegisterBlocState>(
        buildWhen: (previous, current) => previous.name != current.name,
        builder: (context, state) {
          return TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your Full name';
              }
              return null;
            },
            onChanged: (value) {
              context
                  .read<FormRegisterBloc>()
                  .add(FormRegistrationChangeName(name: value));
            },
            decoration: InputDecoration(
              label: const Text('Full Name'),
              hintText: 'Enter Your Full Name',
              hintStyle: const TextStyle(
                color: Colors.black26,
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.black12,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.black12,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
        });
  }
}