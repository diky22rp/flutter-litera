import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_litera/core/usecases/usecase.dart';
import 'package:flutter_litera/features/transaction/domain/usecases/get_my_transactions_usecase.dart';
import 'package:injectable/injectable.dart';
import 'history_event.dart';
import 'history_state.dart';

export 'history_event.dart';
export 'history_state.dart';

@injectable
class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final GetMyTransactionsUseCase getMyTransactionsUseCase;

  HistoryBloc(this.getMyTransactionsUseCase)
    : super(const HistoryState.initial()) {
    on<HistoryEvent>((event, emit) async {
      await event.when(
        fetchHistory: () async {
          emit(const HistoryState.loading());

          final result = await getMyTransactionsUseCase(NoParams());

          result.fold((failure) => emit(HistoryState.error(failure.message)), (
            transactions,
          ) {
            if (transactions.isEmpty) {
              emit(const HistoryState.empty());
            } else {
              emit(HistoryState.loaded(transactions));
            }
          });
        },
      );
    });
  }
}
