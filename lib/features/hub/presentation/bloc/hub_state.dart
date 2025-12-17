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

class HubError extends HubState {
  final String message;
  const HubError(this.message);

  @override
  List<Object> get props => [message];
}
