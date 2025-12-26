import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_litera/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_litera/features/hub/presentation/bloc/hub_bloc.dart';
import 'package:flutter_litera/injection.dart';

List<BlocProvider> get globalBlocProviders => [
  BlocProvider<AuthBloc>(
    create: (_) {
      return sl<AuthBloc>();
    },
  ),

  BlocProvider<HubBloc>(
    create: (_) {
      return sl<HubBloc>();
    },
  ),
];
