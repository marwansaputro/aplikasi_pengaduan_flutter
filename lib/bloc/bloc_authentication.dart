import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:integra_mobile/domain/entities/entities.dart';
import 'package:integra_mobile/data/provider/network/network.dart';
import 'package:integra_mobile/app/services/helper_storage.dart';

part 'bloc_authentication_event.dart';
part 'bloc_authentication_state.dart';

class AuthenticationBloc
    extends Bloc<BlocAuthenticationEvent, BlocAuthenticationState> {
  AuthenticationBloc({
    required this.userRepository,
  }) : super(const BlocAuthenticationState.unknown()) {
    on<BlocAuthenticationEventStatusChange>(_onAuthenticationStatusChanged);

    _authenticationSubscription = userRepository.status.listen((event) {
      add(BlocAuthenticationEventStatusChange(status: event));
    });

    if (SharedPreferenceHelper.instance.token.toString().isNotEmpty) {
      add(BlocAuthenticationEventStatusChange(
          status: AuthenticationStatus.authenticated));
    } else {
      add(BlocAuthenticationEventStatusChange(
          status: AuthenticationStatus.unauthenticated));
    }
  }

  final UserRepository userRepository;
  late StreamSubscription<AuthenticationStatus> _authenticationSubscription;

  Future<void> _onAuthenticationStatusChanged(
    BlocAuthenticationEventStatusChange event,
    Emitter<BlocAuthenticationState> emit,
  ) async {
    switch (event.status) {
      case AuthenticationStatus.unauthenticated:
        return emit(const BlocAuthenticationState.unauthenticated());
      case AuthenticationStatus.authenticated:
        emit(state.copyWith(
            statuGetteringUser: FormzSubmissionStatus.inProgress));

        try {
          final user = await userRepository.userProfile();

          emit(state.copyWith(
              statuGetteringUser: FormzSubmissionStatus.success));

          return emit(BlocAuthenticationState.authenticated(user));
        } catch (e) {
          emit(state.copyWith(
              statuGetteringUser: FormzSubmissionStatus.failure));

          return emit(const BlocAuthenticationState.unauthenticated());
        }
      case AuthenticationStatus.unknown:
        return emit(const BlocAuthenticationState.unknown());
    }
  }

  @override
  Future<void> close() {
    _authenticationSubscription.cancel();

    return super.close();
  }
}
