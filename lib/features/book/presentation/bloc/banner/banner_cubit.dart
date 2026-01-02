import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_litera/core/usecases/usecase.dart';
import 'package:flutter_litera/features/book/domain/entities/banner_entity.dart';
import 'package:flutter_litera/features/book/domain/usecases/get_banners_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'banner_cubit.freezed.dart';

@freezed
class BannerState with _$BannerState {
  const factory BannerState.initial() = _Initial;

  const factory BannerState.loading() = _Loading;

  const factory BannerState.loaded(List<BannerEntity> banners) = _Loaded;

  const factory BannerState.error(String message) = _Error;
}

@injectable
class BannerCubit extends Cubit<BannerState> {
  final GetBannersUseCase getBannersUseCase;

  BannerCubit(this.getBannersUseCase) : super(const BannerState.initial());

  Future<void> loadBanners() async {
    emit(const BannerState.loading());
    final result = await getBannersUseCase(NoParams());

    result.fold(
      (failure) => emit(BannerState.error(failure.message)),
      (banners) => emit(BannerState.loaded(banners)),
    );
  }
}
