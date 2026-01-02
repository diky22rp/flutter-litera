import 'package:cloud_firestore/cloud_firestore.dart'; // Butuh Timestamp
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_litera/features/admin/domain/repositories/admin_rental_repository.dart';
import 'package:flutter_litera/features/transaction/domain/entities/transaction_entity.dart';
import 'package:injectable/injectable.dart';

abstract class AdminTransactionState {}

class AdminTxInitial extends AdminTransactionState {}

class AdminTxLoading extends AdminTransactionState {}

class AdminTxError extends AdminTransactionState {
  final String msg;
  AdminTxError(this.msg);
}

class AdminTxFound extends AdminTransactionState {
  final TransactionEntity order;
  AdminTxFound(this.order);
}

class AdminTxSuccess extends AdminTransactionState {
  final String msg;
  AdminTxSuccess(this.msg);
}

@injectable
class AdminTransactionCubit extends Cubit<AdminTransactionState> {
  final AdminRentalRepository repository;

  AdminTransactionCubit(this.repository) : super(AdminTxInitial());

  void findTransaction(String code) async {
    emit(AdminTxLoading());
    final result = await repository.findOrderByCode(code);
    result.fold(
      (failure) => emit(AdminTxError(failure.message)),
      (order) => emit(AdminTxFound(order)),
    );
  }

  void updateStatus(TransactionEntity order, String nextStatus) async {
    emit(AdminTxLoading());

    final Map<String, dynamic> dataToUpdate = {'status': nextStatus};

    if (nextStatus == 'active') {
      dataToUpdate['pickupDate'] = Timestamp.now();
    } else if (nextStatus == 'completed') {
      final now = DateTime.now();
      dataToUpdate['actualReturnDate'] = Timestamp.fromDate(now);

      if (order.pickupDate != null) {
        final pickupDate = order.pickupDate!;
        final expectedReturnDate = pickupDate.add(
          Duration(days: order.duration),
        );

        final dateNow = DateTime(now.year, now.month, now.day);
        final dateExpected = DateTime(
          expectedReturnDate.year,
          expectedReturnDate.month,
          expectedReturnDate.day,
        );

        final difference = dateNow.difference(dateExpected).inDays;

        if (difference > 0) {
          const double finePerDay = 5000;
          final double totalLateFee = difference * finePerDay;

          dataToUpdate['lateFee'] = totalLateFee;
        } else {
          dataToUpdate['lateFee'] = 0;
        }
      }
    }

    final result = await repository.updateTransactionData(
      order.id,
      dataToUpdate,
    );

    result.fold((failure) => emit(AdminTxError(failure.message)), (_) {
      String successMsg = "Status berhasil diperbarui!";
      if (dataToUpdate['lateFee'] != null &&
          (dataToUpdate['lateFee'] as num) > 0) {
        successMsg =
            "Selesai! Denda keterlambatan: Rp ${dataToUpdate['lateFee']}";
      }
      emit(AdminTxSuccess(successMsg));
    });
  }

  Map<String, dynamic> calculatePenaltyPreview(TransactionEntity order) {
    final pickupDate = order.pickupDate ?? DateTime.now();
    final returnDate = DateTime.now();

    final dueDate = pickupDate.add(Duration(days: order.duration));

    final dateReturn = DateTime(
      returnDate.year,
      returnDate.month,
      returnDate.day,
    );
    final dateDue = DateTime(dueDate.year, dueDate.month, dueDate.day);

    final difference = dateReturn.difference(dateDue).inDays;
    final overdueDays = difference > 0 ? difference : 0;

    const double finePerDay = 5000;
    final double totalFine = overdueDays * finePerDay;

    return {
      'pickupDate': pickupDate,
      'dueDate': dueDate,
      'returnDate': returnDate,
      'overdueDays': overdueDays,
      'finePerDay': finePerDay,
      'totalFine': totalFine,
    };
  }

  void reset() => emit(AdminTxInitial());
}
