import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:integra_mobile/bloc/bloc.dart';
import 'package:integra_mobile/layout/row.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integra_mobile/screens/welcome/forgot_password/screen_forgot_password.dart';
import 'package:integra_mobile/screens/welcome/sign_up/screen_sign_up.dart';
import 'package:integra_mobile/value/theme.dart';
import 'package:integra_mobile/share/widget/atomic/label.dart';

class ScreenSignIn extends StatefulWidget {
  const ScreenSignIn({super.key});

  @override
  State<ScreenSignIn> createState() => _ScreenSignInState();
}

class _ScreenSignInState extends State<ScreenSignIn> {
  final _formSignInKey = GlobalKey<FormState>();
  bool rememberPassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<BlocFormLogin, BlocFormLoginState>(
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
        decoration: const BoxDecoration(
          color: white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
          ),
        ),
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
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (e) => const ScreenSignUp(),
              ),
            );
          },
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
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (e) => const ScreenForgotPassword(),
          ),
        );
      },
      child: const Text(
        'Forget password?',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: darkblue,
        ),
      ),
    );
  }

  Row _rememberMe() {
    return Row(
      children: [
        Checkbox(
          value: rememberPassword,
          onChanged: (bool? value) {
            setState(() {
              rememberPassword = value!;
            });
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
  }

  Widget _buttonSignIn() {
    return BlocBuilder<BlocFormLogin, BlocFormLoginState>(
        builder: (context, state) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: primaryGreen,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => const ConvexButtomBar()),
          // );
          // if (_formSignInKey.currentState!.validate() &&
          //     rememberPassword) {
          //   ScaffoldMessenger.of(context).showSnackBar(
          //     const SnackBar(
          //       content: Text('Processing Data'),
          //     ),
          //   );
          // } else if (!rememberPassword) {
          //   ScaffoldMessenger.of(context).showSnackBar(
          //     const SnackBar(
          //         content: Text(
          //             'Please agree to the processing of personal data')),
          //   );
          // }

          context.read<BlocFormLogin>().add(BlocFormLoginActionLogin());
        },
        child: Text(
          "Sign In",
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: white, fontWeight: FontWeight.w500),
        ),
      );
    });
  }

  Widget _passwordInput(BuildContext context) {
    return BlocBuilder<BlocFormLogin, BlocFormLoginState>(
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
                  .read<BlocFormLogin>()
                  .add(BlocFormLoginEventChangePassword(password: value));
            },
            decoration: InputDecoration(
              label: const Text('Password'),
              hintText: 'Enter Your Password',
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
        });
  }

  Widget _usernameInput(BuildContext context) {
    return BlocBuilder<BlocFormLogin, BlocFormLoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your Email';
            }
            return null;
          },
          onChanged: (value) {
            context
                .read<BlocFormLogin>()
                .add(BlocFormLoginEventChangeEmail(email: value));
          },
          decoration: InputDecoration(
            label: const Text('Email'),
            hintText: 'Enter Your Email',
            hintStyle: const TextStyle(color: Colors.black26),
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
      },
    );
  }
}
