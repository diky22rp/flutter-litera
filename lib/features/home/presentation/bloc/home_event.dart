import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_event.freezed.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.fetchHomeBooks() = _FetchHomeBooks;
  // const factory HomeEvent.refresh() = _Refresh;
  // const factory HomeEvent.searchBook(String query) = _SearchBook;
}
