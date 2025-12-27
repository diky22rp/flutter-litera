import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_litera/core/usecases/usecase.dart';
import 'package:flutter_litera/features/book/domain/usecases/get_genres_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'genre_cubit.freezed.dart';

@freezed
class GenreState with _$GenreState {
  const factory GenreState.initial() = _Initial;
  const factory GenreState.loading() = _Loading;
  const factory GenreState.loaded(List<String> genres) = _Loaded;
  const factory GenreState.error(String message) = _Error;
}

@injectable
class GenreCubit extends Cubit<GenreState> {
  final GetGenresUseCase getGenresUseCase;

  GenreCubit(this.getGenresUseCase) : super(const GenreState.initial());

  Future<void> loadGenres() async {
    if (state is _Loaded) return;

    emit(const GenreState.loading());

    final result = await getGenresUseCase(NoParams());

    result.fold(
      (failure) => emit(GenreState.error(failure.message)),
      (genres) => emit(GenreState.loaded(genres)),
    );
  }
}
