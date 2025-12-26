import 'package:flutter_litera/features/hub/domain/entities/hub_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'hub_state.freezed.dart';

@freezed
class HubEvent with _$HubEvent {
  const factory HubEvent.fetchAllHubs() = _FetchAllHubs;

  const factory HubEvent.selectHub(HubEntity hub) = _SelectHub;

  const factory HubEvent.getSavedHubName() = _GetSavedHubName;

  const factory HubEvent.checkHubSelection() = _CheckHubSelection;
}
