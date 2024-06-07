part of 'bloc_authentication.dart';

class BlocAuthenticationState extends Equatable {
  const BlocAuthenticationState._({
    this.status = AuthenticationStatus.unknown,
    this.user,
    this.statuGetteringUser = FormzSubmissionStatus.initial,
  });

  const BlocAuthenticationState.unknown() : this._();

  const BlocAuthenticationState.authenticated(ModelUser user)
      : this._(
          status: AuthenticationStatus.authenticated,
          user: user,
        );

  const BlocAuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  BlocAuthenticationState copyWith(
      {AuthenticationStatus? status,
      ModelUser? user,
      FormzSubmissionStatus? statuGetteringUser}) {
    return BlocAuthenticationState._(
        status: status ?? this.status,
        user: user ?? this.user,
        statuGetteringUser: statuGetteringUser ?? this.statuGetteringUser);
  }

  final AuthenticationStatus status;
  final ModelUser? user;

  final FormzSubmissionStatus statuGetteringUser;

  @override
  List<Object?> get props => [status, user];
}
