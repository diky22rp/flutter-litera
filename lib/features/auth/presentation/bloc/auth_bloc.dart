import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_litera/core/usecases/usecase.dart';
import 'package:flutter_litera/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_litera/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:flutter_litera/features/auth/domain/usecases/login_usecase.dart';
import 'package:flutter_litera/features/auth/domain/usecases/logout_usecase.dart';
import 'package:flutter_litera/features/auth/domain/usecases/register_usecase.dart';
import 'package:injectable/injectable.dart';

import 'auth_event.dart';
import 'auth_state.dart';

export 'auth_event.dart';
export 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final LogoutUseCase logoutUseCase;
  final RegisterUseCase registerUseCase;
  final GetCurrentUserUseCase getCurrentUserUseCase;
  final AuthRepository authRepository;

  AuthBloc({
    required this.loginUseCase,
    required this.logoutUseCase,
    required this.registerUseCase,
    required this.getCurrentUserUseCase,
    required this.authRepository,
  }) : super(const AuthState.initial()) {
    on<AuthEvent>((event, emit) async {
      await event.when(
        checkAuthStatus: () async {
          emit(const AuthState.loading());
          final result = await getCurrentUserUseCase(NoParams());

          result.fold((failure) => emit(const AuthState.unauthenticated()), (
            user,
          ) {
            if (user != null) {
              emit(AuthState.authenticated(user));
            } else {
              emit(const AuthState.unauthenticated());
            }
          });
        },

        login: (email, password) async {
          emit(const AuthState.loading());
          final result = await loginUseCase(
            LoginParams(email: email, password: password),
          );

          result.fold(
            (failure) => emit(AuthState.error(failure.message)),
            (user) =>
                emit(AuthState.authenticated(user, source: AuthSource.login)),
          );
        },

        register: (name, email, password) async {
          emit(const AuthState.loading());
          final result = await registerUseCase(
            RegisterParams(name: name, email: email, password: password),
          );

          result.fold(
            (failure) => emit(AuthState.error(failure.message)),
            (user) => emit(
              AuthState.authenticated(user, source: AuthSource.register),
            ),
          );
        },

        logout: () async {
          emit(const AuthState.loading());
          final result = await logoutUseCase(NoParams());

          result.fold(
            (failure) => emit(AuthState.error(failure.message)),
            (_) => emit(const AuthState.unauthenticated()),
          );
        },
      );
    });
  }
}
