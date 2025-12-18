part of 'hub_bloc.dart';

sealed class HubState extends Equatable {
  const HubState();

  @override
  List<Object> get props => [];
}

final class HubInitial extends HubState {}

class HubLoading extends HubState {}

class HubLoaded extends HubState {
  final List<HubEntity> hubs;
  const HubLoaded(this.hubs);

  @override
  List<Object> get props => [hubs];
}

class HubNameLoaded extends HubState {
  final String hubName;
  const HubNameLoaded(this.hubName);

  @override
  List<Object> get props => [hubName];
}

class HubError extends HubState {
  final String message;
  const HubError(this.message);

  @override
  List<Object> get props => [message];
}

class HubSelectedSuccess extends HubState {}
