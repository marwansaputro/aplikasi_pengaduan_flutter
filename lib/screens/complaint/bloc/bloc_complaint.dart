import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:integra_mobile/data/provider/network/network.dart';
import 'package:integra_mobile/app/validations/validations.dart';

part 'bloc_complaint_event.dart';
part 'bloc_complaint_state.dart';

class BlocComplaint extends Bloc<BlocComplaintEvent, BlocComplaintState> {
  BlocComplaint({required this.pengaduanRepository})
      : super(const BlocComplaintState()) {
    on<BlocComplaintChangeAppName>(changeAppName);
    on<BlocComplaintChangeCompany>(changeCompany);
    on<BlocComplaintChangeComplaint>(changeComplaint);
    on<BlocComplaintChangeImage>(changeImage);

    on<BlocComplaintActionSubmit>(submit);
  }

  final PengaduanRepository pengaduanRepository;

  changeAppName(
      BlocComplaintChangeAppName event, Emitter<BlocComplaintState> emit) {
    final appName = AppNameValidation.dirty(event.appName);

    emit(state.copyWith(
        appName: appName,
        isValid: Formz.validate([
          appName,
          state.company,
          state.complaint,
          state.image,
        ])));
  }

  changeCompany(
      BlocComplaintChangeCompany event, Emitter<BlocComplaintState> emit) {
    final company = CompanyValidation.dirty(event.company);

    emit(state.copyWith(
        company: company,
        isValid: Formz.validate([
          company,
          state.appName,
          state.complaint,
          state.image,
        ])));
  }

  changeComplaint(
      BlocComplaintChangeComplaint event, Emitter<BlocComplaintState> emit) {
    final complaint = ComplaintValidation.dirty(event.complaint);

    emit(state.copyWith(
      complaint: complaint,
      isValid: Formz.validate([
        complaint,
        state.appName,
        state.company,
        state.image,
      ]),
    ));
  }

  changeImage(
      BlocComplaintChangeImage event, Emitter<BlocComplaintState> emit) {
    final image = FileValidation.dirty(event.image);

    emit(state.copyWith(
      image: image,
      isValid: Formz.validate([
        image,
        state.complaint,
        state.appName,
        state.company,
      ]),
    ));
  }

  submit(
      BlocComplaintActionSubmit event, Emitter<BlocComplaintState> emit) async {
    emit(state.copyWith(
      image: FileValidation.dirty(state.image.value),
      appName: AppNameValidation.dirty(state.appName.value),
      company: CompanyValidation.dirty(state.company.value),
      complaint: ComplaintValidation.dirty(state.complaint.value),
      isValid: Formz.validate([
        state.image,
        state.complaint,
        state.appName,
        state.company,
      ]),
    ));

    if (state.isValid && state.image.value != null) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

      try {
        await pengaduanRepository.createPengaduan(
            aplikasi: state.appName.value,
            kantor: state.company.value,
            pengaduan: state.complaint.value,
            tanggal: DateTime.now(),
            image: state.image.value!);

        emit(state.copyWith(status: FormzSubmissionStatus.success));

        emit(state.reset());
      } catch (e) {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    }
  }
}
