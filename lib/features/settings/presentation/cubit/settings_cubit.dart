import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_litera/core/usecases/usecase.dart';
import 'package:flutter_litera/features/settings/domain/entities/app_setting_entity.dart';
import 'package:flutter_litera/features/settings/domain/usecases/get_settings_usecase.dart';
import 'package:flutter_litera/features/settings/domain/usecases/update_price_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'settings_cubit.freezed.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState.initial() = _Initial;
  const factory SettingsState.loading() = _Loading;
  const factory SettingsState.loaded(AppSettingEntity settings) = _Loaded;
  const factory SettingsState.successUpdate() = _SuccessUpdate;
  const factory SettingsState.error(String message) = _Error;
}

@injectable
class SettingsCubit extends Cubit<SettingsState> {
  final GetSettingsUseCase getSettingsUseCase;
  final UpdatePriceUseCase updatePriceUseCase;

  SettingsCubit(this.getSettingsUseCase, this.updatePriceUseCase)
    : super(const SettingsState.initial());

  Future<void> loadSettings() async {
    emit(const SettingsState.loading());
    final result = await getSettingsUseCase(NoParams());

    result.fold(
      (failure) => emit(SettingsState.error(failure.message)),
      (settings) => emit(SettingsState.loaded(settings)),
    );
  }

  Future<void> updatePrice(int newPrice) async {
    emit(const SettingsState.loading());

    final result = await updatePriceUseCase(newPrice);

    result.fold((failure) => emit(SettingsState.error(failure.message)), (_) {
      emit(const SettingsState.successUpdate());
      loadSettings();
    });
  }
}
