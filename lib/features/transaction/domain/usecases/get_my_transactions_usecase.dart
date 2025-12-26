import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_litera/core/error/failures.dart';
import 'package:flutter_litera/core/usecases/usecase.dart';
import 'package:flutter_litera/features/transaction/domain/entities/transaction_entity.dart';
import 'package:flutter_litera/features/transaction/domain/repositories/transaction_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetMyTransactionsUseCase
    implements UseCase<List<TransactionEntity>, NoParams> {
  final TransactionRepository repository;
  final FirebaseAuth auth;

  GetMyTransactionsUseCase(this.repository, this.auth);

  @override
  Future<Either<Failure, List<TransactionEntity>>> call(NoParams params) async {
    final user = auth.currentUser;

    if (user == null) {
      return Left(ServerFailure("User belum login"));
    }

    return await repository.getMyTransactions(user.uid);
  }
}
