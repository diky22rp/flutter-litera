import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_litera/features/book/presentation/bloc/genre/genre_cubit.dart';
import 'package:flutter_litera/features/book/domain/usecases/get_genres_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_litera/core/error/failures.dart';
import 'package:flutter_litera/core/usecases/usecase.dart';

class MockGetGenresUseCase extends Mock implements GetGenresUseCase {}

void main() {
  late GenreCubit cubit;
  late MockGetGenresUseCase mockGetGenresUseCase;

  setUp(() {
    mockGetGenresUseCase = MockGetGenresUseCase();
    cubit = GenreCubit(mockGetGenresUseCase);
    registerFallbackValue(NoParams());
  });

  test('initial state is GenreState.initial', () {
    expect(cubit.state, equals(const GenreState.initial()));
  });

  group('loadGenres', () {
    test('emits [loading, loaded] when successful', () async {
      final genres = ['Fiksi', 'Non-Fiksi'];
      when(
        () => mockGetGenresUseCase(any()),
      ).thenAnswer((_) async => Right(genres));

      final expected = [const GenreState.loading(), GenreState.loaded(genres)];

      expectLater(cubit.stream, emitsInOrder(expected));
      await cubit.loadGenres();
    });

    test('emits [loading, error] when failure', () async {
      when(
        () => mockGetGenresUseCase(any()),
      ).thenAnswer((_) async => Left(ServerFailure('error')));

      final expected = [const GenreState.loading(), GenreState.error('error')];

      expectLater(cubit.stream, emitsInOrder(expected));
      await cubit.loadGenres();
    });
  });
}
