import 'package:dartz/dartz.dart';
import 'package:flutter_litera/core/error/failures.dart';
import 'package:flutter_litera/features/transaction/data/datasources/transaction_remote_data_source.dart';
import 'package:flutter_litera/features/transaction/data/models/transaction_model.dart';
import 'package:flutter_litera/features/transaction/domain/entities/transaction_entity.dart';
import 'package:flutter_litera/features/transaction/domain/repositories/transaction_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: TransactionRepository)
class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionRemoteDataSource remoteDataSource;

  TransactionRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, void>> createTransaction(
    TransactionEntity transaction,
  ) async {
    try {
      final transactionModel = TransactionModel.fromEntity(transaction);

      await remoteDataSource.createTransaction(transactionModel);

      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TransactionEntity>>> getMyTransactions(
    String userId,
  ) async {
    try {
      final models = await remoteDataSource.getMyTransactions(userId);

      final entities = models.map((model) => model.toEntity()).toList();

      return Right(entities);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
