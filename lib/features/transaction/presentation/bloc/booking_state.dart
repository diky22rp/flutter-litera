import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_state.freezed.dart';

@freezed
class BookingState with _$BookingState {
  const factory BookingState.initial() = _Initial;
  const factory BookingState.loading() = _Loading;
  // const factory BookingState.success() = _Success;
  const factory BookingState.success(String pickupCode) = _Success;
  const factory BookingState.error(String message) = _Error;
}
