import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:integra_mobile/app/services/helper_storage.dart';
import 'package:integra_mobile/data/provider/network/network.dart';
import 'package:integra_mobile/app/validations/validations.dart';

part 'bloc_form_login_state.dart';
part 'bloc_form_login_event.dart';

class BlocFormLogin extends Bloc<BlocFormLoginEvent, BlocFormLoginState> {
  BlocFormLogin({
    required this.userRepository,
  }) : super(const BlocFormLoginState()) {
    on<BlocFormLoginEventChangeEmail>(changeEmail);
    on<BlocFormLoginEventChangePassword>(changePassword);
    on<BlocFormLoginEventChangeRememberMe>(changeRememberMe);

    on<BlocFormLoginActionLogin>(login);
  }

  final AuthRepository userRepository;

  void changeEmail(
      BlocFormLoginEventChangeEmail event, Emitter<BlocFormLoginState> emit) {
    final email = EmailRegistration.dirty(event.email);

    emit(state.copyWith(
        email: email,
        isValid: Formz.validate([
          state.password,
          email,
          state.rememberMe,
        ])));
  }

  void changeRememberMe(BlocFormLoginEventChangeRememberMe event,
      Emitter<BlocFormLoginState> emit) {
    final rememberMe = RememberMeValidation.dirty(event.rememberMe);

    emit(state.copyWith(
        rememberMe: rememberMe,
        isValid: Formz.validate([
          state.password,
          state.email,
          rememberMe,
        ])));
  }

  void changePassword(BlocFormLoginEventChangePassword event,
      Emitter<BlocFormLoginState> emit) {
    final password = PasswordRegistration.dirty(event.password);

    emit(state.copyWith(
        password: password,
        isValid: Formz.validate([
          state.email,
          password,
          state.rememberMe,
        ])));
  }

  Future<void> login(
      BlocFormLoginActionLogin event, Emitter<BlocFormLoginState> emit) async {
    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

      try {
        await userRepository.login(
          email: state.email.value,
          password: state.password.value,
        );

        if (state.rememberMe.value) {
          SharedPreferenceHelper().rememberMe = true;
        }

        emit(state.copyWith(status: FormzSubmissionStatus.success));
      } catch (e) {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    }
  }
}
