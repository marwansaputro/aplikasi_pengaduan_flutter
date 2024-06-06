import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:integra_mobile/share/network/network.dart';
import 'package:integra_mobile/share/validations/validations.dart';

part 'bloc_form_login_state.dart';
part 'bloc_form_login_event.dart';

class BlocFormLogin extends Bloc<BlocFormLoginEvent, BlocFormLoginState> {
  BlocFormLogin({
    required this.userRepository,
  }) : super(const BlocFormLoginState()) {
    on<BlocFormLoginEventChangeEmail>(changeEmail);
    on<BlocFormLoginEventChangePassword>(changePassword);
    on<BlocFormLoginActionLogin>(login);
  }

  final UserRepository userRepository;

  void changeEmail(
      BlocFormLoginEventChangeEmail event, Emitter<BlocFormLoginState> emit) {
    final email = EmailRegistration.dirty(event.email);

    emit(state.copyWith(
        email: email, isValid: Formz.validate([state.password, email])));
  }

  void changePassword(BlocFormLoginEventChangePassword event,
      Emitter<BlocFormLoginState> emit) {
    final password = PasswordRegistration.dirty(event.password);

    emit(state.copyWith(
        password: password, isValid: Formz.validate([state.email, password])));
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

        emit(state.copyWith(status: FormzSubmissionStatus.success));
      } catch (e) {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    }
  }
}
