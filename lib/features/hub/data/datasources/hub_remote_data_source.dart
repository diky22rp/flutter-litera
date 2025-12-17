import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_litera/features/hub/data/models/hub_model.dart';

abstract class HubRemoteDataSource {
  Future<List<HubModel>> getAllHubs();
}

class HubRemoteDataSourceImpl implements HubRemoteDataSource {
  final FirebaseFirestore firestore;

  HubRemoteDataSourceImpl({required this.firestore});

  @override
  Future<List<HubModel>> getAllHubs() async {
    final querySnapshot = await firestore.collection('hubs').get();
    return querySnapshot.docs.map((doc) => HubModel.fromSnapshot(doc)).toList();
  }
}
