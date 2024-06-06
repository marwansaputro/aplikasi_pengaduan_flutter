import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:integra_mobile/model/model.dart';
import 'package:integra_mobile/model/model_user.dart';
import 'package:integra_mobile/share/network/network.dart';
import 'package:integra_mobile/share/storage/helper_storage.dart';

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
        try {
          final user = await userRepository.userProfile();
          return emit(BlocAuthenticationState.authenticated(user));
        } catch (e) {
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
