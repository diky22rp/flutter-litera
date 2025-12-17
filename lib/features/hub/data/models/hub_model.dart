import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_litera/features/hub/domain/entities/hub_entity.dart';

class HubModel extends HubEntity {
  const HubModel({
    required super.id,
    required super.name,
    required super.address,
    required super.location,
    required super.openHour,
  });

  factory HubModel.fromSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return HubModel(
      id: doc.id,
      name: data['name'] ?? '',
      address: data['address'] ?? '',
      location: data['location'] ?? '',
      openHour: data['openHour'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'address': address,
      'location': location,
      'openHour': openHour,
    };
  }
}
