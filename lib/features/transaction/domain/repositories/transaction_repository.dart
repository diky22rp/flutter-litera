import 'package:dartz/dartz.dart';
import 'package:flutter_litera/core/error/failures.dart';
import 'package:flutter_litera/features/transaction/domain/entities/transaction_entity.dart';

abstract class TransactionRepository {
  Future<Either<Failure, void>> createTransaction(
    TransactionEntity transaction,
  );

  Future<Either<Failure, List<TransactionEntity>>> getMyTransactions(
    String userId,
  );
}
