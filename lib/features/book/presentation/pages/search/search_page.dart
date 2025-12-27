import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_litera/features/book/presentation/bloc/genre/genre_cubit.dart';
import 'package:flutter_litera/features/book/presentation/bloc/search/search_bloc.dart';
import 'package:flutter_litera/features/book/presentation/pages/search/search_view.dart';
import 'package:flutter_litera/injection.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              sl<SearchBloc>()..add(const SearchEvent.applyFilter()),
        ),
        BlocProvider(create: (context) => sl<GenreCubit>()..loadGenres()),
      ],
      child: const SearchView(),
    );
  }
}
