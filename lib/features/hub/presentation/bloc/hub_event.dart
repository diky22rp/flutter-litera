part of 'hub_bloc.dart';

sealed class HubEvent extends Equatable {
  const HubEvent();

  @override
  List<Object> get props => [];
}

class FetchAllHubs extends HubEvent {}

class SelectHub extends HubEvent {
  final String hubId;
  const SelectHub(this.hubId);
}
