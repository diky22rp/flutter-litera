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
    required String hubName,
    required int duration,
    required double totalPrice,
    required String paymentMethod,
    required String status,
    required String pickupCode,
    required DateTime orderDate,
    DateTime? pickupDate,
    DateTime? actualReturnDate,
    @Default(0) double lateFee,
  }) = _TransactionEntity;
}
