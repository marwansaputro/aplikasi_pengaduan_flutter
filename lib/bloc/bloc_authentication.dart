import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bloc_authentication_event.dart';
part 'bloc_authentication_state.dart';

class AuthenticationBloc
    extends Bloc<BlocAuthenticationEvent, BlocAuthenticationState> {
  AuthenticationBloc(super.initialState) {
    on<AuthenticationLoginRequested>(login);
    on<AuthenticationRegisterRequested>(register);
    on<AuthenticationLogoutRequested>(logout);
    on<AuthenticationUsernameChange>(usernameChange);
    on<AuthenticationPasswordChange>(passwordChange);
  }

  void login(AuthenticationLoginRequested event,
      Emitter<BlocAuthenticationState> emit) {}

  void register(AuthenticationRegisterRequested event,
      Emitter<BlocAuthenticationState> emit) {}

  void logout(AuthenticationLogoutRequested event,
      Emitter<BlocAuthenticationState> emit) {}

  void usernameChange(AuthenticationUsernameChange event,
      Emitter<BlocAuthenticationState> emit) {
    emit(state.copyWith(
      username: event.username,
    ));
  }

  void passwordChange(AuthenticationPasswordChange event,
      Emitter<BlocAuthenticationState> emit) {
    emit(state.copyWith(
      password: event.password,
    ));
  }
}
