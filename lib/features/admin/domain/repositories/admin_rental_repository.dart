import 'package:dartz/dartz.dart';
import 'package:flutter_litera/core/error/failures.dart';
import 'package:flutter_litera/features/transaction/domain/entities/transaction_entity.dart';

abstract class AdminRentalRepository {
  Future<Either<Failure, TransactionEntity>> findOrderByCode(String code);

  Future<Either<Failure, void>> updateTransactionData(
    String docId,
    Map<String, dynamic> data,
  );
}
