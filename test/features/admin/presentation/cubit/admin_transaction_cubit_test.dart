import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_litera/features/admin/presentation/cubit/admin_transaction_cubit.dart';
import 'package:flutter_litera/features/admin/domain/repositories/admin_rental_repository.dart';
import 'package:flutter_litera/features/transaction/domain/entities/transaction_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_litera/core/error/failures.dart';

class MockAdminRentalRepository extends Mock implements AdminRentalRepository {}

void main() {
  late AdminTransactionCubit cubit;
  late MockAdminRentalRepository mockRepository;

  setUp(() {
    mockRepository = MockAdminRentalRepository();
    cubit = AdminTransactionCubit(mockRepository);
    registerFallbackValue('dummy');
    registerFallbackValue(<String, dynamic>{});
  });

  test('initial state is AdminTxInitial', () {
    expect(cubit.state, isA<AdminTxInitial>());
  });

  group('findTransaction', () {
    test('emits [AdminTxLoading, AdminTxFound] when found', () async {
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
      when(
        () => mockRepository.findOrderByCode(any()),
      ).thenAnswer((_) async => Right(transaction));

      final expected = [isA<AdminTxLoading>(), isA<AdminTxFound>()];
      expectLater(cubit.stream, emitsInOrder(expected));
      cubit.findTransaction('ABC123');
    });

    test('emits [AdminTxLoading, AdminTxError] when error', () async {
      when(
        () => mockRepository.findOrderByCode(any()),
      ).thenAnswer((_) async => Left(ServerFailure('error')));
      final expected = [isA<AdminTxLoading>(), isA<AdminTxError>()];
      expectLater(cubit.stream, emitsInOrder(expected));
      cubit.findTransaction('ABC123');
    });
  });

  group('updateStatus', () {
    test(
      'emits [AdminTxLoading, AdminTxSuccess] when update success',
      () async {
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
        when(
          () => mockRepository.updateTransactionData(any(), any()),
        ).thenAnswer((_) async => const Right(unit));
        final expected = [isA<AdminTxLoading>(), isA<AdminTxSuccess>()];
        expectLater(cubit.stream, emitsInOrder(expected));
        cubit.updateStatus(transaction, 'active');
      },
    );
    test('emits [AdminTxLoading, AdminTxError] when update fails', () async {
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
      when(
        () => mockRepository.updateTransactionData(any(), any()),
      ).thenAnswer((_) async => Left(ServerFailure('error')));
      final expected = [isA<AdminTxLoading>(), isA<AdminTxError>()];
      expectLater(cubit.stream, emitsInOrder(expected));
      cubit.updateStatus(transaction, 'active');
    });
  });

  test('reset emits AdminTxInitial', () async {
    expectLater(cubit.stream, emits(isA<AdminTxInitial>()));
    cubit.reset();
  });
}
