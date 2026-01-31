import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_litera/core/presentation/widgets/transaction_status_badge.dart';

void main() {
  testWidgets('TransactionStatusBadge status waiting_pickup', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: TransactionStatusBadge(status: 'waiting_pickup')),
    );
    expect(find.text('Menunggu Diambil'), findsOneWidget);
    expect(find.byIcon(Icons.access_time_filled), findsOneWidget);
  });

  testWidgets('TransactionStatusBadge status active', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: TransactionStatusBadge(status: 'active')),
    );
    expect(find.text('Sedang Dipinjam'), findsOneWidget);
    expect(find.byIcon(Icons.book), findsOneWidget);
  });

  testWidgets('TransactionStatusBadge status completed', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: TransactionStatusBadge(status: 'completed')),
    );
    expect(find.text('Selesai'), findsOneWidget);
    expect(find.byIcon(Icons.check_circle), findsOneWidget);
  });

  testWidgets('TransactionStatusBadge status unknown', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: TransactionStatusBadge(status: 'unknown')),
    );
    expect(find.text('UNKNOWN'), findsOneWidget);
    expect(find.byIcon(Icons.info), findsOneWidget);
  });
}
