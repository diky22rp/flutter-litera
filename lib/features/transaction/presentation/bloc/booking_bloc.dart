import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_litera/core/usecases/usecase.dart';
import 'package:flutter_litera/features/hub/domain/usecases/get_saved_hub_id_usecase.dart';
import 'package:flutter_litera/features/transaction/domain/entities/transaction_entity.dart';
import 'package:flutter_litera/features/transaction/domain/usecases/create_transaction_usecase.dart';
import 'package:injectable/injectable.dart';

import 'booking_event.dart';
import 'booking_state.dart';

export 'booking_event.dart';
export 'booking_state.dart';

@injectable
class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final CreateTransactionUseCase createTransactionUseCase;
  final GetSavedHubIdUseCase getSavedHubIdUseCase;
  final FirebaseAuth firebaseAuth;

  BookingBloc({
    required this.createTransactionUseCase,
    required this.getSavedHubIdUseCase,
    required this.firebaseAuth,
  }) : super(const BookingState.initial()) {
    on<BookingEvent>((event, emit) async {
      await event.when(
        rentBook:
            (book, durationInDays, totalPrice, paymentMethod, hubName) async {
              emit(const BookingState.loading());

              final user = firebaseAuth.currentUser;
              if (user == null) {
                emit(
                  const BookingState.error("Silakan login terlebih dahulu."),
                );
                return;
              }

              final hubResult = await getSavedHubIdUseCase(NoParams());

              await hubResult.fold(
                (failure) async => emit(
                  const BookingState.error("Gagal mengambil lokasi hub."),
                ),
                (hubId) async {
                  if (hubId == null) {
                    emit(
                      const BookingState.error(
                        "Pilih lokasi toko dulu di Home!",
                      ),
                    );
                    return;
                  }

                  final String newId =
                      "TRX-${DateTime.now().millisecondsSinceEpoch}"; // ID Unik
                  final String pickupCode =
                      _generatePickupCode(); // Kode Pickup #A1B2

                  final transaction = TransactionEntity(
                    id: newId,
                    userId: user.uid,
                    bookId: book.id,
                    bookTitle: book.title,
                    bookCover: book.coverUrl,
                    hubId: hubId,
                    hubName: hubName,
                    duration: durationInDays,
                    totalPrice: totalPrice,
                    paymentMethod: paymentMethod,
                    status: 'waiting_pickup', // Status awal: Menunggu diambil
                    pickupCode: pickupCode,
                    orderDate: DateTime.now(),
                  );

                  // 4. Simpan ke Firebase
                  final result = await createTransactionUseCase(transaction);

                  result.fold(
                    (failure) => emit(BookingState.error(failure.message)),
                    (_) => emit(BookingState.success(pickupCode)),
                  );
                },
              );
            },
      );
    });
  }

  String _generatePickupCode() {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = Random();
    final code = List.generate(
      5,
      (index) => chars[random.nextInt(chars.length)],
    ).join();
    return "#A$code";
  }
}
