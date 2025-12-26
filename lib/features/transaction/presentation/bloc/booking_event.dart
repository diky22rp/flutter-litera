import 'package:flutter_litera/features/book/domain/entities/book_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_event.freezed.dart';

@freezed
abstract class BookingEvent with _$BookingEvent {
  const factory BookingEvent.rentBook({
    required BookEntity book,
    required int durationInDays,
    required double totalPrice,
    required String paymentMethod,
    required String hubName,
  }) = _RentBook;
}
