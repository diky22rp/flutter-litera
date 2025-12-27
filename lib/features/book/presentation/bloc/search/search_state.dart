import 'package:flutter_litera/features/book/domain/entities/book_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_state.freezed.dart';

enum SearchStatus { initial, loading, success, failure }

@freezed
abstract class SearchState with _$SearchState {
  const factory SearchState({
    @Default(SearchStatus.initial) SearchStatus status,
    @Default([]) List<BookEntity> books,
    @Default(false) bool hasReachedMax,
    @Default(1) int page,
    String? errorMessage,

    // Filter
    @Default('') String keyword,
    @Default('newest') String sort,
    int? year,
    String? genre,
  }) = _SearchState;
}
