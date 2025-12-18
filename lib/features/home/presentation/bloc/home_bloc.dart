import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_litera/core/usecases/usecase.dart';
import 'package:flutter_litera/features/home/domain/entities/book_entity.dart';
import 'package:flutter_litera/features/home/domain/usecases/get_books_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetBooksUseCase getBooksUseCase;

  HomeBloc({required this.getBooksUseCase}) : super(HomeInitial()) {
    on<FetchHomeBooks>((event, emit) async {
      emit(HomeLoading());
      final result = await getBooksUseCase(NoParams());
      result.fold(
        (failure) => emit(HomeError(failure.message)),
        (books) => emit(HomeLoaded(books: books)),
      );
    });
  }
}
