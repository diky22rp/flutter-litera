import 'package:flutter_litera/features/hub/domain/entities/hub_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'hub_event.freezed.dart';

@freezed
class HubState with _$HubState {
  const factory HubState.initial() = _Initial;
  const factory HubState.loading() = _Loading;

  const factory HubState.loaded(List<HubEntity> hubs) = _Loaded;

  const factory HubState.hubNameLoaded(String hubName) = _HubNameLoaded;

  const factory HubState.error(String message) = _Error;

  const factory HubState.selectedSuccess() = _SelectedSuccess;

  const factory HubState.hubSelected(String hubId) = _HubSelected;
  const factory HubState.hubNotSelected() = _HubNotSelected;
}
