import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:integra_mobile/data/repositories/notification_repository.dart';
import 'package:integra_mobile/domain/entities/model_notification.dart';

part 'bloc_notification_event.dart';
part 'bloc_notification_state.dart';

class BlocNotification
    extends Bloc<BlocNotificationEvent, BlocNotificationState> {
  BlocNotification({
    required this.notificationRepository,
  }) : super(const BlocNotificationState()) {
    on<BlocNotificationEventGetData>(getData);
  }

  final NotificationRepository notificationRepository;

  getData(BlocNotificationEventGetData event,
      Emitter<BlocNotificationState> emit) async {
    final page = event.page ?? state.currentPage;

    if (state.status != FormzSubmissionStatus.inProgress) {
      try {
        emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

        var data = await notificationRepository.listHistory(page: page);

        emit(state.copyWith(
            status: FormzSubmissionStatus.success,
            isMore: data.nextPageUrl != null,
            currentPage: data.currentPage,
            data: page != 1
                ? [
                    ...state.data,
                    ...data.data,
                  ]
                : data.data));
      } catch (e) {
        log(e.toString());
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    }
  }
}
