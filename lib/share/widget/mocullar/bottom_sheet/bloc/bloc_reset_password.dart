import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:integra_mobile/app/validations/validations.dart';
import 'package:integra_mobile/data/provider/network/network.dart';

part 'bloc_reset_password_event.dart';
part 'bloc_reset_password_state.dart';

class BlocResetPassword
    extends Bloc<BlocResetPasswordEvent, BlocResetPasswordState> {
  BlocResetPassword(this.userRepository)
      : super(const BlocResetPasswordState()) {
    on<BlocResetPasswordChangeEmail>(changeEmail);
    on<BlocResetPasswordSend>(submit);
  }

  final AuthRepository userRepository;

  changeEmail(BlocResetPasswordChangeEmail event,
      Emitter<BlocResetPasswordState> emit) {
    final email = EmailRegistration.dirty(event.email);

    emit(state.copyWith(
      email: email,
      isValid: Formz.validate([email]),
    ));
  }

  submit(
      BlocResetPasswordSend event, Emitter<BlocResetPasswordState> emit) async {
    emit(state.copyWith(
        email: EmailRegistration.dirty(state.email.value),
        isValid: Formz.validate([state.email])));

    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

      try {
        await userRepository.resetPassword(
          email: state.email.value,
        );

        emit(state.copyWith(status: FormzSubmissionStatus.success));
      } catch (e) {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    }
  }
}
