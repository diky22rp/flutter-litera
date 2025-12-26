import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_litera/core/usecases/usecase.dart';
import 'package:flutter_litera/features/book/domain/usecases/get_books_usecase.dart';
import 'package:injectable/injectable.dart';

import 'home_event.dart';
import 'home_state.dart';

export 'home_event.dart';
export 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetBooksUseCase getBooksUseCase;

  HomeBloc({required this.getBooksUseCase}) : super(const HomeState.initial()) {
    on<HomeEvent>((event, emit) async {
      await event.when(
        fetchHomeBooks: () async {
          emit(const HomeState.loading());

          final result = await getBooksUseCase(NoParams());

          result.fold(
            (failure) => emit(HomeState.error(failure.message)),
            (books) => emit(HomeState.loaded(books: books)),
          );
        },
      );
    });
  }
}
