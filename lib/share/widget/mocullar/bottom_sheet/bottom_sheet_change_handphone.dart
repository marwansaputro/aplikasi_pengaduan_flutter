import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:integra_mobile/app/config/theme.dart';
import 'package:integra_mobile/bloc/bloc.dart';
import 'package:integra_mobile/layout/padding.dart';
import 'package:integra_mobile/share/widget/mocullar/bottom_sheet/bloc/bloc_user_change_handphone.dart';
import 'package:integra_mobile/share/widget/button/button_solid_green.dart';
import 'package:integra_mobile/share/widget/mocullar/form/form_input.dart';

class BottomSheetChangeHandphone extends StatelessWidget {
  const BottomSheetChangeHandphone({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthenticationBloc>().state;

    return BlocProvider(
      create: (context) =>
          BlocUserChangeHandphone(userRepository: context.read()),
      child:
          BlocListener<BlocUserChangeHandphone, BlocUserChangeHandphoneState>(
        listener: (context, state) {
          if (state.status.isFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(const SnackBar(
                  behavior: SnackBarBehavior.floating,
                  content: Text("Tidak berhasil mengubah Handphone")));
          }

          if (state.status.isSuccess) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(const SnackBar(
                  behavior: SnackBarBehavior.floating,
                  content: Text("Berhasil mengubah nama dari handphone")));

            Navigator.pop(context);
          }
        },
        child: SizedBox(
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
                  const SizedBox(height: 20),
                  BlocBuilder<BlocUserChangeHandphone,
                          BlocUserChangeHandphoneState>(
                      buildWhen: (previous, current) =>
                          previous.handphone != current.handphone,
                      builder: (context, state) {
                        return MyFormInput(
                          onChanged: (value) {
                            context.read<BlocUserChangeHandphone>().add(
                                BlocUserChangeHandphoneEventChangeHandphone(
                                    handphone: value ?? ''));
                          },
                          hintText: authState.user?.phoneNumber ?? '',
                          labelText: "Handphone",
                        );
                      }),
                  const SizedBox(height: 20),
                  Center(
                    child: BlocBuilder<BlocUserChangeHandphone,
                            BlocUserChangeHandphoneState>(
                        builder: (context, state) {
                      return ButtonSolidGreen(
                        title: 'Save',
                        ontap: () {
                          context
                              .read<BlocUserChangeHandphone>()
                              .add(BlocUserChangeHandphoneSubmit());
                        },
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
