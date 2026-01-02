import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_litera/features/book/domain/entities/banner_entity.dart';

class BannerModel extends BannerEntity {
  const BannerModel({
    required super.id,
    required super.title,
    required super.subtitle,
    required super.imageUrl,
    required super.targetScreen,
    required super.targetData,
  });

  factory BannerModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return BannerModel(
      id: doc.id,
      title: data['title'] ?? '',
      subtitle: data['subtitle'] ?? '',
      imageUrl: data['image_url'] ?? '',
      targetScreen: data['target_screen'] ?? 'promo',
      targetData: data['target_data'] ?? '',
    );
  }
}
