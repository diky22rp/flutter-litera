import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_litera/core/usecases/usecase.dart';
import 'package:flutter_litera/features/hub/domain/entities/hub_entity.dart';
import 'package:flutter_litera/features/hub/domain/usecases/cache_hub_id_usecase.dart';
import 'package:flutter_litera/features/hub/domain/usecases/get_all_hubs_usecase.dart';

part 'hub_event.dart';
part 'hub_state.dart';

class HubBloc extends Bloc<HubEvent, HubState> {
  final GetAllHubsUseCase getAllHubsUseCase;
  final CacheHubIdUseCase cacheHubIdUseCase;

  HubBloc({required this.getAllHubsUseCase, required this.cacheHubIdUseCase})
    : super(HubInitial()) {
    on<FetchAllHubs>((event, emit) async {
      emit(HubLoading());

      final result = await getAllHubsUseCase(NoParams());

      result.fold(
        (failure) => emit(HubError(failure.message)),
        (hubs) => emit(HubLoaded(hubs)),
      );
    });

    on<SelectHub>((event, emit) async {
      final result = await cacheHubIdUseCase(event.hub);
      result.fold(
        (failure) => emit(HubError(failure.message)),
        (_) => emit(HubSelectedSuccess()),
      );
    });
  }
}
