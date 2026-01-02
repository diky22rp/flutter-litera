import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_litera/features/book/data/models/banner_model.dart';
import 'package:injectable/injectable.dart';

abstract class BannerRemoteDataSource {
  Future<List<BannerModel>> getBanners();
}

@LazySingleton(as: BannerRemoteDataSource)
class BannerRemoteDataSourceImpl implements BannerRemoteDataSource {
  final FirebaseFirestore firestore;

  BannerRemoteDataSourceImpl(this.firestore);

  @override
  Future<List<BannerModel>> getBanners() async {
    try {
      final snapshot = await firestore
          .collection('banners')
          .where('active', isEqualTo: true)
          .get();

      return snapshot.docs
          .map((doc) => BannerModel.fromFirestore(doc))
          .toList();
    } catch (e) {
      throw Exception("Gagal ambil banner: $e");
    }
  }
}
