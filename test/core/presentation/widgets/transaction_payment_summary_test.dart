import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_litera/core/presentation/widgets/transaction_payment_summary.dart';
import 'package:flutter_litera/features/transaction/domain/entities/transaction_entity.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  setUpAll(() async {
    await initializeDateFormatting('id_ID', null);
  });

  testWidgets('TransactionPaymentSummary tampil info pembayaran', (
    tester,
  ) async {
    final transaction = TransactionEntity(
      id: '1',
      userId: 'user1',
      bookId: 'book1',
      bookTitle: 'Book Title',
      bookCover: 'cover.png',
      hubId: 'hub1',
      hubName: 'Hub Name',
      duration: 3,
      totalPrice: 10000,
      paymentMethod: 'cash',
      status: 'pending',
      pickupCode: 'ABC123',
      orderDate: DateTime.now(),
    );
    await tester.pumpWidget(
      MaterialApp(
        home: TransactionPaymentSummary(
          transaction: transaction,
          showTitle: true,
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Rincian Transaksi'), findsOneWidget);
    expect(find.text('Total Bayar'), findsOneWidget);
    expect(find.textContaining('Rp'), findsWidgets);
  });
}
