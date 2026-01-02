import 'package:equatable/equatable.dart';

class AppSettingEntity extends Equatable {
  final int rentalPricePerDay;

  const AppSettingEntity({required this.rentalPricePerDay});

  @override
  List<Object?> get props => [rentalPricePerDay];
}
