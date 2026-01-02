import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_litera/features/settings/domain/entities/app_setting_entity.dart';

class AppSettingModel extends AppSettingEntity {
  const AppSettingModel({required super.rentalPricePerDay});

  factory AppSettingModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>?;
    return AppSettingModel(
      rentalPricePerDay: data?['rental_price_per_day'] ?? 5000,
    );
  }
}
