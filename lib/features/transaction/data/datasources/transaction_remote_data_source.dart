import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_litera/features/transaction/data/models/transaction_model.dart';
import 'package:injectable/injectable.dart';

abstract class TransactionRemoteDataSource {
  Future<void> createTransaction(TransactionModel transaction);
  Future<List<TransactionModel>> getMyTransactions(String userId);
}

@LazySingleton(as: TransactionRemoteDataSource)
class TransactionRemoteDataSourceImpl implements TransactionRemoteDataSource {
  final FirebaseFirestore firestore;

  TransactionRemoteDataSourceImpl({required this.firestore});

  @override
  Future<void> createTransaction(TransactionModel transaction) async {
    await firestore
        .collection('transactions')
        .doc(transaction.id)
        .set(transaction.toMap());
  }

  @override
  Future<List<TransactionModel>> getMyTransactions(String userId) async {
    final querySnapshot = await firestore
        .collection('transactions')
        .where('userId', isEqualTo: userId)
        .orderBy('orderDate', descending: true)
        .get();

    return querySnapshot.docs
        .map((doc) => TransactionModel.fromMap(doc.data()))
        .toList();
  }
}
