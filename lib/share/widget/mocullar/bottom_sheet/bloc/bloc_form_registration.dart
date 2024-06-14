import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:integra_mobile/data/provider/network/network.dart';
import 'package:integra_mobile/app/validations/validations.dart';

part 'bloc_form_registration_event.dart';
part 'bloc_form_registration_state.dart';

class FormRegisterBloc
    extends Bloc<FormRegisterBlocEvent, FormRegisterBlocState> {
  FormRegisterBloc({required this.userRepository})
      : super(const FormRegisterBlocState()) {
    on<FormRegistrationChangeName>(changeName);
    on<FormRegistrationChangeEmail>(changeEmail);
    on<FormRegistrationChangePassword>(changePassword);
    on<FormRegisterActionRegistration>(registration);
  }

  final AuthRepository userRepository;

  void changeName(
      FormRegistrationChangeName event, Emitter<FormRegisterBlocState> emit) {
    final name = NameRegistration.dirty(event.name);

    emit(state.copyWith(
        name: name,
        isValid: Formz.validate([state.password, name, state.email])));
  }

  void changeEmail(
      FormRegistrationChangeEmail event, Emitter<FormRegisterBlocState> emit) {
    final email = EmailRegistration.dirty(event.email);

    emit(state.copyWith(
        email: email,
        isValid: Formz.validate([state.password, state.name, email])));
  }

  void changePassword(FormRegistrationChangePassword event,
      Emitter<FormRegisterBlocState> emit) {
    final password = PasswordRegistration.dirty(event.password);

    emit(state.copyWith(
        password: password,
        isValid: Formz.validate([password, state.name, state.email])));
  }

  Future<void> registration(FormRegisterActionRegistration event,
      Emitter<FormRegisterBlocState> emit) async {
    emit(state.copyWith(
        email: EmailRegistration.dirty(state.email.value),
        name: NameRegistration.dirty(state.name.value),
        password: PasswordRegistration.dirty(state.password.value),
        isValid: Formz.validate([
          state.email,
          state.password,
          state.name,
        ])));

    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

      try {
        await userRepository.register(
            name: state.name.value,
            email: state.email.value,
            password: state.password.value);

        emit(state.copyWith(status: FormzSubmissionStatus.success));
      } catch (e) {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    }
  }
}
