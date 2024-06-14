import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:integra_mobile/app/validations/validations.dart';
import 'package:integra_mobile/data/provider/network/network.dart';

class BlocUserChangePasswordEvent {}

class BlocUserChangePasswordEventChangeOldPassword
    extends BlocUserChangePasswordEvent {
  final String password;

  BlocUserChangePasswordEventChangeOldPassword({required this.password});
}

class BlocUserChangePasswordEventChangeNewPassword
    extends BlocUserChangePasswordEvent {
  final String password;

  BlocUserChangePasswordEventChangeNewPassword({required this.password});
}

class BlocUserChangePasswordSubmit extends BlocUserChangePasswordEvent {}

class BlocUserChangePasswordState extends Equatable {
  final FormzSubmissionStatus status;

  final PasswordRegistration oldPassword;
  final PasswordRegistration newPassword;

  final Exception? exception;

  final bool isValid;

  const BlocUserChangePasswordState(
      {this.status = FormzSubmissionStatus.initial,
      this.oldPassword = const PasswordRegistration.pure(),
      this.newPassword = const PasswordRegistration.pure(),
      this.exception,
      this.isValid = false});

  BlocUserChangePasswordState copyWith({
    FormzSubmissionStatus? status,
    PasswordRegistration? oldPassword,
    PasswordRegistration? newPassword,
    bool? isValid,
    Exception? exception,
  }) {
    return BlocUserChangePasswordState(
      isValid: isValid ?? this.isValid,
      oldPassword: oldPassword ?? this.oldPassword,
      newPassword: newPassword ?? this.newPassword,
      status: status ?? this.status,
      exception: exception ?? this.exception,
    );
  }

  @override
  List<Object?> get props =>
      [status, oldPassword, isValid, exception, newPassword];
}

class BlocUserChangePassword
    extends Bloc<BlocUserChangePasswordEvent, BlocUserChangePasswordState> {
  BlocUserChangePassword({
    required this.userRepository,
  }) : super(const BlocUserChangePasswordState()) {
    on<BlocUserChangePasswordEventChangeOldPassword>(changeOldPassword);
    on<BlocUserChangePasswordEventChangeNewPassword>(changeNewPassword);

    on<BlocUserChangePasswordSubmit>(submit);
  }

  final UserRepository userRepository;

  FutureOr<void> changeOldPassword(
      BlocUserChangePasswordEventChangeOldPassword event,
      Emitter<BlocUserChangePasswordState> emit) {
    final oldPassword = PasswordRegistration.dirty(event.password);

    emit(state.copyWith(
        oldPassword: oldPassword,
        isValid: Formz.validate([oldPassword, state.newPassword])));
  }

  FutureOr<void> changeNewPassword(
      BlocUserChangePasswordEventChangeNewPassword event,
      Emitter<BlocUserChangePasswordState> emit) {
    final newPassword = PasswordRegistration.dirty(event.password);

    emit(state.copyWith(
        newPassword: newPassword,
        isValid: Formz.validate([newPassword, state.oldPassword])));
  }

  Future<FutureOr<void>> submit(BlocUserChangePasswordSubmit event,
      Emitter<BlocUserChangePasswordState> emit) async {
    emit(state.copyWith(
      newPassword: PasswordRegistration.dirty(state.newPassword.value),
      oldPassword: PasswordRegistration.dirty(state.oldPassword.value),
      isValid: Formz.validate([state.newPassword, state.oldPassword]),
    ));

    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

      try {
        await userRepository.updatePassword(
            newPassword: state.newPassword.value,
            oldPassword: state.oldPassword.value);

        emit(state.copyWith(status: FormzSubmissionStatus.success));
      } catch (e) {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    }
  }
}
