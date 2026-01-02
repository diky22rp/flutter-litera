import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_litera/features/settings/data/models/app_setting_model.dart';
import 'package:injectable/injectable.dart';

abstract class SettingsRemoteDataSource {
  Future<AppSettingModel> getSettings();
  Future<void> updateRentalPrice(int price);
}

@LazySingleton(as: SettingsRemoteDataSource)
class SettingsRemoteDataSourceImpl implements SettingsRemoteDataSource {
  final FirebaseFirestore firestore;
  SettingsRemoteDataSourceImpl(this.firestore);

  @override
  Future<AppSettingModel> getSettings() async {
    final doc = await firestore.collection('settings').doc('general').get();
    if (!doc.exists) {
      return const AppSettingModel(rentalPricePerDay: 5000); // Default
    }
    return AppSettingModel.fromFirestore(doc);
  }

  @override
  Future<void> updateRentalPrice(int price) async {
    await firestore.collection('settings').doc('general').set({
      'rental_price_per_day': price,
      'updated_at': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }
}
