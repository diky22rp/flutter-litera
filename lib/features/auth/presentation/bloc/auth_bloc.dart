import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_litera/core/usecases/usecase.dart';
import 'package:flutter_litera/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_litera/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_litera/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:flutter_litera/features/auth/domain/usecases/login_usecase.dart';
import 'package:flutter_litera/features/auth/domain/usecases/logout_usecase.dart';
import 'package:flutter_litera/features/auth/domain/usecases/register_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final LogoutUseCase logoutUseCase;
  final RegisterUseCase registerUseCase;
  final AuthRepository authRepository;
  final GetCurrentUserUseCase getCurrentUserUseCase;

  AuthBloc({
    required this.loginUseCase,
    required this.logoutUseCase,
    required this.registerUseCase,
    required this.authRepository,
    required this.getCurrentUserUseCase,
  }) : super(const AuthState.initial()) {
    on<_CheckAuthStatus>((event, emit) async {
      emit(const AuthState.loading());
      final result = await getCurrentUserUseCase(NoParams());

      result.fold((failure) => emit(const AuthState.unauthenticated()), (user) {
        if (user != null) {
          emit(AuthState.authenticated(user));
        } else {
          emit(const AuthState.unauthenticated());
        }
      });
    });

    on<_Login>((event, emit) async {
      emit(const AuthState.loading());
      final result = await loginUseCase(
        LoginParams(email: event.email, password: event.password),
      );

      result.fold(
        (failure) => emit(AuthState.error(failure.message)),
        (user) => emit(AuthState.authenticated(user, source: AuthSource.login)),
      );
    });

    on<_Register>((event, emit) async {
      emit(const AuthState.loading());
      final result = await registerUseCase(
        RegisterParams(
          name: event.name,
          email: event.email,
          password: event.password,
        ),
      );

      result.fold(
        (failure) => emit(AuthState.error(failure.message)),
        (user) =>
            emit(AuthState.authenticated(user, source: AuthSource.register)),
      );
    });

    on<_Logout>((event, emit) async {
      emit(const AuthState.loading());
      final result = await logoutUseCase(NoParams());

      result.fold(
        (failure) => emit(AuthState.error(failure.message)),
        (_) => emit(const AuthState.unauthenticated()),
      );
    });
  }
}
