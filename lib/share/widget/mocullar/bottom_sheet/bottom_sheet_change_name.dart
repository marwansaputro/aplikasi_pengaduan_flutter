import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:integra_mobile/app/config/theme.dart';
import 'package:integra_mobile/bloc/bloc.dart';
import 'package:integra_mobile/layout/padding.dart';
import 'package:integra_mobile/share/widget/mocullar/bottom_sheet/bloc/bloc_user_change_name.dart';
import 'package:integra_mobile/share/widget/button/button_solid_green.dart';
import 'package:integra_mobile/share/widget/mocullar/form/form_input.dart';

class BottomSheetChangeName extends StatelessWidget {
  const BottomSheetChangeName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthenticationBloc>().state;

    return BlocProvider(
      create: (context) => BlocUserChangeName(
        userRepository: context.read(),
      ),
      child: BlocListener<BlocUserChangeName, BlocUserChangeNameState>(
        listener: (context, state) {
          if (state.status.isFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(const SnackBar(
                  behavior: SnackBarBehavior.floating,
                  content: Text("Tidak berhasil mengubah nama")));
          }

          if (state.status.isSuccess) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(const SnackBar(
                  behavior: SnackBarBehavior.floating,
                  content: Text("Berhasil mengubah nama dari user")));

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
                  BlocBuilder<BlocUserChangeName, BlocUserChangeNameState>(
                      buildWhen: (previous, current) =>
                          previous.name != current.name,
                      builder: (context, state) {
                        return MyFormInput(
                          hintText: authState.user?.name ?? '',
                          labelText: "Name",
                          onChange: (value) {
                            context.read<BlocUserChangeName>().add(
                                BlocUserChangeNameEventChangeName(
                                    name: value ?? ''));
                          },
                        );
                      }),
                  const SizedBox(height: 20),
                  Center(
                    child: BlocBuilder<BlocUserChangeName,
                            BlocUserChangeNameState>(
                        buildWhen: (previous, current) =>
                            previous.status != current.status,
                        builder: (context, state) {
                          if (state.status.isInProgress) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          return ButtonSolidGreen(
                            title: 'Save',
                            ontap: () {
                              context
                                  .read<BlocUserChangeName>()
                                  .add(BlocUserChangeNameSubmit());
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
