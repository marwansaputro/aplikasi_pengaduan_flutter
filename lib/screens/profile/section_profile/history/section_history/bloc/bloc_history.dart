import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:integra_mobile/domain/entities/entities.dart';
import 'package:integra_mobile/data/provider/network/network.dart';

part 'bloc_history_event.dart';
part 'bloc_history_state.dart';

class BlocHistory extends Bloc<BlocHistoryEvent, BlocHistoryState> {
  final PengaduanRepository pengaduanRepository;

  BlocHistory(this.pengaduanRepository)
      : super(const BlocHistoryState(
          data: [],
        )) {
    on<BlocHistoryGetData>(getData);
  }

  getData(BlocHistoryGetData event, Emitter<BlocHistoryState> emit) async {
    final page = event.page;

    if (state.status != FormzSubmissionStatus.inProgress) {
      try {
        emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

        var data = await pengaduanRepository.listHistory();

        emit(state.copyWith(
            status: FormzSubmissionStatus.success,
            currentPage: data.currentPage,
            isMore: data.nextPageUrl != null,
            data: page == 1
                ? data.data
                : [
                    ...state.data,
                    ...data.data,
                  ]));
      } catch (e) {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    }
  }
}
