import 'dart:async';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:integra_mobile/data/provider/network/network.dart';

class BlocChangeImageEvent {}

class BlocChangeImageEventChangeImage extends BlocChangeImageEvent {
  final File file;

  BlocChangeImageEventChangeImage({required this.file});
}

class BlocChangeImageState extends Equatable {
  final FormzSubmissionStatus status;
  final File? file;
  final bool isValid;

  const BlocChangeImageState(
      {this.status = FormzSubmissionStatus.initial,
      this.file,
      this.isValid = false});

  BlocChangeImageState copyWith({
    FormzSubmissionStatus? status,
    File? file,
    bool? isValid,
  }) {
    return BlocChangeImageState(
      status: status ?? this.status,
      file: file ?? this.file,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object?> get props => [status, file, isValid];
}

class BlocChangeImage extends Bloc<BlocChangeImageEvent, BlocChangeImageState> {
  BlocChangeImage(this.userRepository) : super(const BlocChangeImageState()) {
    on<BlocChangeImageEventChangeImage>(changeImage);
  }

  final UserRepository userRepository;

  Future<FutureOr<void>> changeImage(BlocChangeImageEventChangeImage event,
      Emitter<BlocChangeImageState> emit) async {
    if (state.status != FormzSubmissionStatus.inProgress) {
      try {
        emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

        await userRepository.updateImageProfile(image: event.file);

        emit(state.copyWith(status: FormzSubmissionStatus.success));
      } catch (e) {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    }
  }
}
