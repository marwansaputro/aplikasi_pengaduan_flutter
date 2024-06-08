import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:integra_mobile/data/provider/network/network.dart';
import 'package:integra_mobile/share/validations/validations.dart';

part 'bloc_complaint_event.dart';
part 'bloc_complaint_state.dart';

class BlocComplaint extends Bloc<BlocComplaintEvent, BlocComplaintState> {
  BlocComplaint({required this.pengaduanRepository})
      : super(const BlocComplaintState()) {
    on<BlocComplaintChangeAppName>(changeAppName);
    on<BlocComplaintChangeCompany>(changeCompany);
    on<BlocComplaintChangeComplaint>(changeComplaint);
    on<BlocComplaintActionSubmit>(submit);
  }

  final PengaduanRepository pengaduanRepository;

  changeAppName(
      BlocComplaintChangeAppName event, Emitter<BlocComplaintState> emit) {
    final appName = AppNameValidation.dirty(event.appName);

    emit(state.copyWith(
        appName: appName,
        isValid: Formz.validate([appName, state.company, state.complaint])));
  }

  changeCompany(
      BlocComplaintChangeCompany event, Emitter<BlocComplaintState> emit) {
    final company = CompanyValidation.dirty(event.company);

    emit(state.copyWith(
        company: company,
        isValid: Formz.validate([company, state.appName, state.complaint])));
  }

  changeComplaint(
      BlocComplaintChangeComplaint event, Emitter<BlocComplaintState> emit) {
    final complaint = ComplaintValidation.dirty(event.complaint);

    emit(state.copyWith(
      complaint: complaint,
      isValid: Formz.validate([complaint, state.appName, state.company]),
    ));
  }

  submit(
      BlocComplaintActionSubmit event, Emitter<BlocComplaintState> emit) async {
    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

      try {
        await pengaduanRepository.createPengaduan(
          aplikasi: state.appName.value,
          kantor: state.company.value,
          pengaduan: state.complaint.value,
          tanggal: DateTime.now(),
        );

        emit(state.copyWith(status: FormzSubmissionStatus.success));
      } catch (e) {
        print(e.toString());

        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    }
  }
}
