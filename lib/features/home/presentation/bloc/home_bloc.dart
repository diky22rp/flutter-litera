import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_litera/core/usecases/usecase.dart';
import 'package:flutter_litera/features/book/domain/entities/book_entity.dart';
import 'package:flutter_litera/features/book/presentation/usecases/get_books_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetBooksUseCase getBooksUseCase;

  HomeBloc({required this.getBooksUseCase}) : super(const HomeState.initial()) {
    on<HomeEvent>((event, emit) async {
      await event.when(
        fetchHomeBooks: () async {
          // Logic dimulai
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
