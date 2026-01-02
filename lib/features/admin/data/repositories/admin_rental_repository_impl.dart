import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_litera/core/error/failures.dart';
import 'package:flutter_litera/features/admin/domain/repositories/admin_rental_repository.dart';
import 'package:flutter_litera/features/transaction/domain/entities/transaction_entity.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AdminRentalRepository)
class AdminRentalRepositoryImpl implements AdminRentalRepository {
  final FirebaseFirestore firestore;

  AdminRentalRepositoryImpl(this.firestore);

  @override
  Future<Either<Failure, TransactionEntity>> findOrderByCode(
    String code,
  ) async {
    try {
      final snapshot = await firestore
          .collection('transactions')
          .where('pickupCode', isEqualTo: code)
          .limit(1)
          .get();

      if (snapshot.docs.isNotEmpty) {
        final doc = snapshot.docs.first;
        final data = doc.data();

        final transaction = TransactionEntity(
          id: doc.id,
          userId: data['userId'] ?? '',
          bookId: data['bookId'] ?? '',
          bookTitle: data['bookTitle'] ?? '',
          bookCover: data['bookCover'] ?? '',
          hubId: data['hubId'] ?? '',
          hubName: data['hubName'] ?? '',
          duration: (data['duration'] ?? 0) as int,
          totalPrice: (data['totalPrice'] ?? 0).toDouble(),
          paymentMethod: data['paymentMethod'] ?? 'CASH',
          status: data['status'] ?? 'waiting_pickup',
          pickupCode: data['pickupCode'] ?? '',
          orderDate: (data['orderDate'] as Timestamp).toDate(),

          pickupDate: data['pickupDate'] != null
              ? (data['pickupDate'] as Timestamp).toDate()
              : null,
          actualReturnDate: data['actualReturnDate'] != null
              ? (data['actualReturnDate'] as Timestamp).toDate()
              : null,
          lateFee: (data['lateFee'] ?? 0).toDouble(),
        );

        return Right(transaction);
      }
      return Left(ServerFailure("Kode Transaksi tidak ditemukan."));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateTransactionData(
    String docId,
    Map<String, dynamic> data,
  ) async {
    try {
      final dataToUpdate = Map<String, dynamic>.from(data);

      dataToUpdate['updated_at'] = FieldValue.serverTimestamp();

      await firestore
          .collection('transactions')
          .doc(docId)
          .update(dataToUpdate);

      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
