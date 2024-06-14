import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:integra_mobile/app/services/helper_storage.dart';
import 'package:integra_mobile/data/provider/network/network.dart';
import 'package:cron/cron.dart';

part 'bloc_notification_state.dart';
part 'bloc_notification_event.dart';

class BlocRootNotification
    extends Bloc<BlocRootNotificationEvent, BlocRootNotificationState> {
  BlocRootNotification(
      {required this.notificationRepository, required this.authRepository})
      : super(const BlocRootNotificationState()) {
    on<BlocRootNotificationCount>(onCount);
    on<BlocRootNotificationRead>(onRead);
    on<BlocRootNotificationReadAll>(onReadAll);

    cron = Cron();

    cron.schedule(Schedule(minutes: 5), () async {
      if (SharedPreferenceHelper.instance.token != null &&
          SharedPreferenceHelper.instance.token != '') {
        add(BlocRootNotificationCount());
      }
    });
  }

  final NotificationRepository notificationRepository;
  final AuthRepository authRepository;

  late Cron cron;
  late StreamSubscription<AuthenticationStatus> _authenticationSubcription;

  Future<FutureOr<void>> onCount(BlocRootNotificationCount event,
      Emitter<BlocRootNotificationState> emit) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    try {
      final data = await notificationRepository.count();

      emit(state.copyWith(
          status: FormzSubmissionStatus.success, count: data.data));
    } catch (e) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }

  Future<FutureOr<void>> onRead(BlocRootNotificationRead event,
      Emitter<BlocRootNotificationState> emit) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    try {
      await notificationRepository.read(id: event.id);

      emit(state.copyWith(status: FormzSubmissionStatus.success));

      add(BlocRootNotificationCount());
    } catch (e) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }

  Future<FutureOr<void>> onReadAll(BlocRootNotificationReadAll event,
      Emitter<BlocRootNotificationState> emit) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    try {
      await notificationRepository.readAll();

      emit(state.copyWith(status: FormzSubmissionStatus.success));

      add(BlocRootNotificationCount());
    } catch (e) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }

  @override
  Future<void> close() {
    _authenticationSubcription.cancel();
    cron.close();

    return super.close();
  }
}
