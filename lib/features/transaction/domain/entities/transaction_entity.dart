import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_entity.freezed.dart';

@freezed
abstract class TransactionEntity with _$TransactionEntity {
  const factory TransactionEntity({
    required String id,
    required String userId,
    required String bookId,
    required String bookTitle,
    required String bookCover,
    required String hubId,
    required int duration,
    required double totalPrice,
    required String paymentMethod,
    required String status, // 'waiting_pickup', 'completed'
    required String pickupCode, // Kode unik #A1B2
    required DateTime orderDate,
  }) = _TransactionEntity;
}
