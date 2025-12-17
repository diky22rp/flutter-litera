import 'package:equatable/equatable.dart';

class HubEntity extends Equatable {
  final String id;
  final String name;
  final String address;
  final String location;
  final String openHour;

  const HubEntity({
    required this.id,
    required this.name,
    required this.address,
    required this.location,
    required this.openHour,
  });

  @override
  List<Object> get props => [id, name, address, location, openHour];
}
