import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_litera/core/usecases/usecase.dart';
import 'package:flutter_litera/features/hub/domain/usecases/cache_hub_id_usecase.dart';
import 'package:flutter_litera/features/hub/domain/usecases/get_all_hubs_usecase.dart';
import 'package:flutter_litera/features/hub/domain/usecases/get_cached_hub_name_usecase.dart';
import 'package:flutter_litera/features/hub/domain/usecases/get_saved_hub_id_usecase.dart';
import 'package:injectable/injectable.dart';

import 'hub_event.dart';
import 'hub_state.dart';

export 'hub_event.dart';
export 'hub_state.dart';

@injectable
class HubBloc extends Bloc<HubEvent, HubState> {
  final GetAllHubsUseCase getAllHubsUseCase;
  final CacheHubIdUseCase cacheHubIdUseCase;
  final GetCachedHubNameUseCase getCachedHubNameUseCase;
  final GetSavedHubIdUseCase getSavedHubIdUseCase;

  HubBloc({
    required this.getAllHubsUseCase,
    required this.cacheHubIdUseCase,
    required this.getCachedHubNameUseCase,
    required this.getSavedHubIdUseCase,
  }) : super(const HubState.initial()) {
    on<HubEvent>((event, emit) async {
      await event.when(
        fetchAllHubs: () async {
          emit(const HubState.loading());
          final result = await getAllHubsUseCase(NoParams());
          result.fold(
            (failure) => emit(HubState.error(failure.message)),
            (hubs) => emit(HubState.loaded(hubs)),
          );
        },

        selectHub: (hub) async {
          emit(const HubState.loading());
          final result = await cacheHubIdUseCase(hub);
          result.fold((failure) => emit(HubState.error(failure.message)), (_) {
            // emit(const HubState.selectedSuccess());

            emit(HubState.hubNameLoaded(hub.name));
          });
        },

        getSavedHubName: () async {
          final result = await getCachedHubNameUseCase(NoParams());

          result.fold(
            (failure) {
              emit(const HubState.initial());
            },
            (name) {
              if (name == null) {
                emit(const HubState.initial());
              } else {
                emit(HubState.hubNameLoaded(name));
              }
            },
          );
        },

        checkHubSelection: () async {
          final result = await getSavedHubIdUseCase(NoParams());

          result.fold((failure) => emit(const HubState.hubNotSelected()), (
            hubId,
          ) {
            if (hubId != null && hubId.isNotEmpty) {
              emit(HubState.hubSelected(hubId));
            } else {
              emit(const HubState.hubNotSelected());
            }
          });
        },
      );
    });
  }
}
