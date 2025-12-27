import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_litera/features/book/domain/usecases/search_books_usecase.dart';
import 'package:injectable/injectable.dart';

import 'search_event.dart';
import 'search_state.dart';

export 'search_event.dart';
export 'search_state.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchBooksUseCase searchBooksUseCase;

  SearchBloc(this.searchBooksUseCase) : super(const SearchState()) {
    on<ApplyFilter>((event, emit) async {
      emit(
        state.copyWith(
          status: SearchStatus.loading,
          hasReachedMax: false,
          page: 1,
          books: [],
          keyword: event.keyword ?? state.keyword,
          sort: event.sort ?? state.sort,
          year: event.year,
          genre: event.genre,
        ),
      );

      final result = await searchBooksUseCase(
        FilterBookParams(
          keyword: state.keyword,
          sort: state.sort,
          year: state.year,
          genre: state.genre,
          page: 1,
        ),
      );

      result.fold(
        (failure) => emit(
          state.copyWith(
            status: SearchStatus.failure,
            errorMessage: failure.message,
          ),
        ),
        (newBooks) {
          emit(
            state.copyWith(
              status: SearchStatus.success,
              books: newBooks,
              hasReachedMax: newBooks.length < 10,
              page: 1,
            ),
          );
        },
      );
    });

    //HANDLE INFINITE SCROLL
    on<FetchNextPage>((event, emit) async {
      if (state.hasReachedMax) return;

      if (state.status == SearchStatus.loading) return;

      final nextPage = state.page + 1;

      final result = await searchBooksUseCase(
        FilterBookParams(
          keyword: state.keyword,
          sort: state.sort,
          year: state.year,
          genre: state.genre,
          page: nextPage,
        ),
      );

      result.fold((failure) {}, (newBooks) {
        if (newBooks.isEmpty) {
          emit(state.copyWith(hasReachedMax: true));
        } else {
          emit(
            state.copyWith(
              status: SearchStatus.success,
              books: List.of(state.books)..addAll(newBooks),
              hasReachedMax: newBooks.length < 10,
              page: nextPage,
            ),
          );
        }
      });
    });
  }
}
