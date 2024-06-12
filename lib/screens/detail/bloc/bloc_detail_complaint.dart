import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:integra_mobile/data/provider/network/network.dart';
import 'package:integra_mobile/domain/entities/entities.dart';

part 'bloc_detail_complaint_event.dart';
part 'bloc_detail_complaint_state.dart';

class BlocDetailComplaint
    extends Bloc<BlocDetailComplaintEvent, BlocDetailComplaintState> {
  BlocDetailComplaint(this.pengaduanRepository)
      : super(const BlocDetailComplaintState()) {
    on<BlocDetailComplaintGetData>(getData);
  }

  final PengaduanRepository pengaduanRepository;

  Future<FutureOr<void>> getData(BlocDetailComplaintGetData event,
      Emitter<BlocDetailComplaintState> emit) async {
    if (state.status != FormzSubmissionStatus.inProgress) {
      try {
        emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

        var data = await pengaduanRepository.detail(idPengaduan: event.id);

        emit(state.copyWith(
            status: FormzSubmissionStatus.success, detail: data.data));
      } catch (e) {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    }
  }
}
