part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

//UI STATE FLOW
final class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthUnauthenticated extends AuthState {}

//RESULT STATE /SIDE EFFECT
sealed class AuthResultState extends AuthState {
  const AuthResultState();
}

enum AuthSource { login, register }

class AuthAuthenticated extends AuthResultState {
  final UserEntity user;
  final AuthSource source;

  const AuthAuthenticated({required this.user, required this.source});

  @override
  List<Object> get props => [user, source];
}

class AuthError extends AuthResultState {
  final String message;
  const AuthError(this.message);

  @override
  List<Object> get props => [message];
}
