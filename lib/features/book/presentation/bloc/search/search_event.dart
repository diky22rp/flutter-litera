import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_event.freezed.dart';

@freezed
class SearchEvent with _$SearchEvent {
  const factory SearchEvent.applyFilter({
    String? keyword,
    String? sort,
    int? year,
    String? genre,
  }) = ApplyFilter;

  const factory SearchEvent.fetchNextPage() = FetchNextPage;
}
