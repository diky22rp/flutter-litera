import 'package:equatable/equatable.dart';

class BannerEntity extends Equatable {
  final String id;
  final String title;
  final String subtitle;
  final String imageUrl;
  final String targetScreen; // 'promo', 'book_detail', 'web'
  final String targetData; //  Link URL, atau Konten Promo

  const BannerEntity({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.targetScreen,
    required this.targetData,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    subtitle,
    imageUrl,
    targetScreen,
    targetData,
  ];
}
