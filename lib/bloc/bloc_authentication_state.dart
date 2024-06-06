part of 'bloc_authentication.dart';

class BlocAuthenticationState extends Equatable {
  BlocAuthenticationState({
    this.password,
    this.username,
  });

  final String? username;
  final String? password;

  BlocAuthenticationState copyWith({
    String? username,
    String? password,
  }) {
    return BlocAuthenticationState(
      password: password ?? this.password,
      username: username ?? this.username,
    );
  }

  @override
  List<Object?> get props => [username, password];
}
