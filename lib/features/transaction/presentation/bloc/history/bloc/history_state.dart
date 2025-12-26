import 'package:flutter_litera/features/transaction/domain/entities/transaction_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_state.freezed.dart';

@freezed
abstract class HistoryState with _$HistoryState {
  const factory HistoryState.initial() = _Initial;
  const factory HistoryState.loading() = _Loading;
  // 👇 Bawa List Transaksi
  const factory HistoryState.loaded(List<TransactionEntity> transactions) =
      _Loaded;
  const factory HistoryState.empty() = _Empty;
  const factory HistoryState.error(String message) = _Error;
}
