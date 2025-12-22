part of 'auth_bloc.dart';

enum AuthSource { login, register, initial }

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;

  const factory AuthState.authenticated(
    UserEntity user, {
    @Default(AuthSource.initial) AuthSource source,
  }) = _Authenticated;

  const factory AuthState.unauthenticated() = _Unauthenticated;

  const factory AuthState.error(String message) = _Error;
}
