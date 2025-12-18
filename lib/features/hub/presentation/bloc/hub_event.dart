part of 'hub_bloc.dart';

sealed class HubEvent extends Equatable {
  const HubEvent();

  @override
  List<Object> get props => [];
}

class FetchAllHubs extends HubEvent {}

class SelectHub extends HubEvent {
  final HubEntity hub;
  const SelectHub(this.hub);

  @override
  List<Object> get props => [hub];
}

class GetSavedHubName extends HubEvent {}
