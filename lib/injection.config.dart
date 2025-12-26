// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:dio/dio.dart' as _i361;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import 'core/di/register_module.dart' as _i854;
import 'features/auth/data/datasources/auth_remote_data_source.dart' as _i767;
import 'features/auth/data/repositories/auth_repository_impl.dart' as _i111;
import 'features/auth/domain/repositories/auth_repository.dart' as _i1015;
import 'features/auth/domain/usecases/get_current_user_usecase.dart' as _i630;
import 'features/auth/domain/usecases/login_usecase.dart' as _i206;
import 'features/auth/domain/usecases/logout_usecase.dart' as _i824;
import 'features/auth/domain/usecases/register_usecase.dart' as _i693;
import 'features/auth/presentation/bloc/auth_bloc.dart' as _i363;
import 'features/book/data/datasources/book_remote_data_source.dart' as _i776;
import 'features/book/data/repositories/book_repository_impl.dart' as _i253;
import 'features/book/domain/repositories/book_repository.dart' as _i839;
import 'features/book/domain/usecases/get_books_usecase.dart' as _i873;
import 'features/home/presentation/bloc/home_bloc.dart' as _i123;
import 'features/hub/data/datasources/hub_local_data_source.dart' as _i232;
import 'features/hub/data/datasources/hub_remote_data_source.dart' as _i739;
import 'features/hub/data/repositories/hub_repository_impl.dart' as _i938;
import 'features/hub/domain/repositories/hub_repository.dart' as _i74;
import 'features/hub/domain/usecases/cache_hub_id_usecase.dart' as _i353;
import 'features/hub/domain/usecases/get_all_hubs_usecase.dart' as _i721;
import 'features/hub/domain/usecases/get_cached_hub_name_usecase.dart' as _i812;
import 'features/hub/domain/usecases/get_saved_hub_id_usecase.dart' as _i116;
import 'features/hub/presentation/bloc/hub_bloc.dart' as _i138;
import 'features/transaction/data/datasources/transaction_remote_data_source.dart'
    as _i614;
import 'features/transaction/data/repositories/transaction_repository_impl.dart'
    as _i16;
import 'features/transaction/domain/repositories/transaction_repository.dart'
    as _i463;
import 'features/transaction/domain/usecases/create_transaction_usecase.dart'
    as _i655;
import 'features/transaction/domain/usecases/get_my_transactions_usecase.dart'
    as _i974;
import 'features/transaction/presentation/bloc/booking_bloc.dart' as _i417;
import 'features/transaction/presentation/bloc/history/bloc/history_bloc.dart'
    as _i903;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i59.FirebaseAuth>(() => registerModule.firebaseAuth);
    gh.lazySingleton<_i974.FirebaseFirestore>(() => registerModule.firestore);
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i232.HubLocalDataSource>(
      () => _i232.HubLocalDataSourceImpl(
        sharedPreferences: gh<_i460.SharedPreferences>(),
      ),
    );
    gh.lazySingleton<_i614.TransactionRemoteDataSource>(
      () => _i614.TransactionRemoteDataSourceImpl(
        firestore: gh<_i974.FirebaseFirestore>(),
      ),
    );
    gh.lazySingleton<_i767.AuthRemoteDataSource>(
      () => _i767.AuthRemoteDataSourceImpl(
        firebaseAuth: gh<_i59.FirebaseAuth>(),
        firestore: gh<_i974.FirebaseFirestore>(),
      ),
    );
    gh.lazySingleton<_i463.TransactionRepository>(
      () => _i16.TransactionRepositoryImpl(
        remoteDataSource: gh<_i614.TransactionRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i1015.AuthRepository>(
      () => _i111.AuthRepositoryImpl(
        remoteDataSource: gh<_i767.AuthRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i776.BookRemoteDataSource>(
      () => _i776.BookRemoteDataSourceImpl(dio: gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i739.HubRemoteDataSource>(
      () => _i739.HubRemoteDataSourceImpl(
        firestore: gh<_i974.FirebaseFirestore>(),
      ),
    );
    gh.lazySingleton<_i839.BookRepository>(
      () => _i253.BookRepositoryImpl(
        remoteDataSource: gh<_i776.BookRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i873.GetBooksUseCase>(
      () => _i873.GetBooksUseCase(gh<_i839.BookRepository>()),
    );
    gh.factory<_i123.HomeBloc>(
      () => _i123.HomeBloc(getBooksUseCase: gh<_i873.GetBooksUseCase>()),
    );
    gh.lazySingleton<_i74.HubRepository>(
      () => _i938.HubRepositoryImpl(
        remoteDataSource: gh<_i739.HubRemoteDataSource>(),
        localDataSource: gh<_i232.HubLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i353.CacheHubIdUseCase>(
      () => _i353.CacheHubIdUseCase(gh<_i74.HubRepository>()),
    );
    gh.lazySingleton<_i721.GetAllHubsUseCase>(
      () => _i721.GetAllHubsUseCase(gh<_i74.HubRepository>()),
    );
    gh.lazySingleton<_i812.GetCachedHubNameUseCase>(
      () => _i812.GetCachedHubNameUseCase(gh<_i74.HubRepository>()),
    );
    gh.lazySingleton<_i116.GetSavedHubIdUseCase>(
      () => _i116.GetSavedHubIdUseCase(gh<_i74.HubRepository>()),
    );
    gh.lazySingleton<_i655.CreateTransactionUseCase>(
      () => _i655.CreateTransactionUseCase(gh<_i463.TransactionRepository>()),
    );
    gh.lazySingleton<_i630.GetCurrentUserUseCase>(
      () => _i630.GetCurrentUserUseCase(gh<_i1015.AuthRepository>()),
    );
    gh.lazySingleton<_i206.LoginUseCase>(
      () => _i206.LoginUseCase(gh<_i1015.AuthRepository>()),
    );
    gh.lazySingleton<_i824.LogoutUseCase>(
      () => _i824.LogoutUseCase(gh<_i1015.AuthRepository>()),
    );
    gh.lazySingleton<_i693.RegisterUseCase>(
      () => _i693.RegisterUseCase(gh<_i1015.AuthRepository>()),
    );
    gh.factory<_i417.BookingBloc>(
      () => _i417.BookingBloc(
        createTransactionUseCase: gh<_i655.CreateTransactionUseCase>(),
        getSavedHubIdUseCase: gh<_i116.GetSavedHubIdUseCase>(),
        firebaseAuth: gh<_i59.FirebaseAuth>(),
      ),
    );
    gh.factory<_i363.AuthBloc>(
      () => _i363.AuthBloc(
        loginUseCase: gh<_i206.LoginUseCase>(),
        logoutUseCase: gh<_i824.LogoutUseCase>(),
        registerUseCase: gh<_i693.RegisterUseCase>(),
        getCurrentUserUseCase: gh<_i630.GetCurrentUserUseCase>(),
        authRepository: gh<_i1015.AuthRepository>(),
      ),
    );
    gh.lazySingleton<_i974.GetMyTransactionsUseCase>(
      () => _i974.GetMyTransactionsUseCase(
        gh<_i463.TransactionRepository>(),
        gh<_i59.FirebaseAuth>(),
      ),
    );
    gh.factory<_i138.HubBloc>(
      () => _i138.HubBloc(
        getAllHubsUseCase: gh<_i721.GetAllHubsUseCase>(),
        cacheHubIdUseCase: gh<_i353.CacheHubIdUseCase>(),
        getCachedHubNameUseCase: gh<_i812.GetCachedHubNameUseCase>(),
        getSavedHubIdUseCase: gh<_i116.GetSavedHubIdUseCase>(),
      ),
    );
    gh.factory<_i903.HistoryBloc>(
      () => _i903.HistoryBloc(gh<_i974.GetMyTransactionsUseCase>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i854.RegisterModule {}
