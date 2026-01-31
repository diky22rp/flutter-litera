import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_litera/features/transaction/presentation/pages/transaction_detail_page.dart';
import 'package:flutter_litera/features/transaction/domain/entities/transaction_entity.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  setUpAll(() async {
    await initializeDateFormatting('id_ID', null);
  });

  testWidgets('TransactionDetailPage menampilkan info transaksi', (
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
      MaterialApp(home: TransactionDetailPage(transaction: transaction)),
    );
    expect(find.text('Detail Pesanan'), findsOneWidget);
    expect(find.text('KODE PICK-UP'), findsOneWidget);
    expect(find.text('ABC123'), findsWidgets); // Bisa lebih dari satu
    expect(find.text('Butuh Bantuan?'), findsOneWidget);
  });

  testWidgets('TransactionDetailPage tombol bantuan tampil', (tester) async {
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
      MaterialApp(home: TransactionDetailPage(transaction: transaction)),
    );
    expect(find.byIcon(Icons.help_outline), findsOneWidget);
    expect(find.text('Butuh Bantuan?'), findsOneWidget);
  });
}
