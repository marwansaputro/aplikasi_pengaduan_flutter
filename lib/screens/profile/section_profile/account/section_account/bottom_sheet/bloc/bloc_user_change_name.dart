import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:integra_mobile/app/validations/validations.dart';
import 'package:integra_mobile/data/provider/network/network.dart';

class BlocUserChangeNameEvent {}

class BlocUserChangeNameEventChangeName extends BlocUserChangeNameEvent {
  final String name;

  BlocUserChangeNameEventChangeName({required this.name});
}

class BlocUserChangeNameSubmit extends BlocUserChangeNameEvent {}

class BlocUserChangeNameState extends Equatable {
  final FormzSubmissionStatus status;
  final NameRegistration name;

  final Exception? exception;

  final bool isValid;

  const BlocUserChangeNameState(
      {this.status = FormzSubmissionStatus.initial,
      this.name = const NameRegistration.pure(),
      this.exception,
      this.isValid = false});

  BlocUserChangeNameState copyWith({
    FormzSubmissionStatus? status,
    NameRegistration? name,
    bool? isValid,
    Exception? exception,
  }) {
    return BlocUserChangeNameState(
      isValid: isValid ?? this.isValid,
      name: name ?? this.name,
      status: status ?? this.status,
      exception: exception ?? this.exception,
    );
  }

  @override
  List<Object?> get props => [status, name, isValid, exception];
}

class BlocUserChangeName
    extends Bloc<BlocUserChangeNameEvent, BlocUserChangeNameState> {
  BlocUserChangeName(this.userRepository)
      : super(const BlocUserChangeNameState()) {
    on<BlocUserChangeNameEventChangeName>(changeName);
    on<BlocUserChangeNameSubmit>(submit);
  }

  final UserRepository userRepository;

  FutureOr<void> changeName(BlocUserChangeNameEventChangeName event,
      Emitter<BlocUserChangeNameState> emit) {
    final name = NameRegistration.dirty(event.name);

    emit(state.copyWith(name: name, isValid: Formz.validate([name])));
  }

  Future<FutureOr<void>> submit(BlocUserChangeNameSubmit event,
      Emitter<BlocUserChangeNameState> emit) async {
    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

      try {
        await userRepository.updateName(name: state.name.value);

        emit(state.copyWith(status: FormzSubmissionStatus.success));
      } catch (e) {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    }
  }
}
