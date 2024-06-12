import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:integra_mobile/app/validations/handphone.dart';
import 'package:integra_mobile/bloc/bloc.dart';
import 'package:integra_mobile/data/provider/network/network.dart';

class BlocUserChangeHandphoneEvent {}

class BlocUserChangeHandphoneEventChangeHandphone
    extends BlocUserChangeHandphoneEvent {
  final String handphone;

  BlocUserChangeHandphoneEventChangeHandphone({required this.handphone});
}

class BlocUserChangeHandphoneSubmit extends BlocUserChangeHandphoneEvent {}

class BlocUserChangeHandphoneState extends Equatable {
  final FormzSubmissionStatus status;
  final HandphoneValidation handphone;

  final Exception? exception;

  final bool isValid;

  const BlocUserChangeHandphoneState(
      {this.status = FormzSubmissionStatus.initial,
      this.handphone = const HandphoneValidation.pure(),
      this.exception,
      this.isValid = false});

  BlocUserChangeHandphoneState copyWith({
    FormzSubmissionStatus? status,
    HandphoneValidation? handphone,
    bool? isValid,
    Exception? exception,
  }) {
    return BlocUserChangeHandphoneState(
      isValid: isValid ?? this.isValid,
      handphone: handphone ?? this.handphone,
      status: status ?? this.status,
      exception: exception ?? this.exception,
    );
  }

  @override
  List<Object?> get props => [status, handphone, isValid, exception];
}

class BlocUserChangeHandphone
    extends Bloc<BlocUserChangeHandphoneEvent, BlocUserChangeHandphoneState> {
  BlocUserChangeHandphone({
    required this.userRepository,
  }) : super(const BlocUserChangeHandphoneState()) {
    on<BlocUserChangeHandphoneEventChangeHandphone>(changeHandphone);
    on<BlocUserChangeHandphoneSubmit>(submit);
  }

  final UserRepository userRepository;
  FutureOr<void> changeHandphone(
      BlocUserChangeHandphoneEventChangeHandphone event,
      Emitter<BlocUserChangeHandphoneState> emit) {
    final handphone = HandphoneValidation.dirty(event.handphone);

    emit(state.copyWith(
        handphone: handphone, isValid: Formz.validate([handphone])));
  }

  Future<FutureOr<void>> submit(BlocUserChangeHandphoneSubmit event,
      Emitter<BlocUserChangeHandphoneState> emit) async {
    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

      try {
        await userRepository.updateHandphone(handphone: state.handphone.value);

        emit(state.copyWith(status: FormzSubmissionStatus.success));
      } catch (e) {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    }
  }
}
