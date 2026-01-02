import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_litera/core/constants/app_colors.dart';
import 'package:flutter_litera/core/presentation/widgets/transaction_item_card.dart'; // Import Widget Global
import 'package:flutter_litera/features/transaction/presentation/bloc/history/bloc/history_bloc.dart';
import 'package:flutter_litera/injection.dart';
import 'package:go_router/go_router.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<HistoryBloc>()..add(const HistoryEvent.fetchHistory()),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: const Text(
            "Riwayat Sewa",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: const BackButton(color: Colors.black),
        ),
        body: BlocBuilder<HistoryBloc, HistoryState>(
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => const Center(child: CircularProgressIndicator()),

              error: (msg) => Center(child: Text(msg)),

              empty: () => const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.history, size: 80, color: Colors.grey),
                    SizedBox(height: 16),
                    Text("Belum ada riwayat sewa."),
                  ],
                ),
              ),

              loaded: (transactions) {
                return ListView.separated(
                  padding: const EdgeInsets.all(20),
                  itemCount: transactions.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final trx = transactions[index];

                    return TransactionItemCard(
                      transaction: trx,
                      onTap: () {
                        context.pushNamed('transaction-detail', extra: trx);
                      },
                    );
                  },
                );
              },

              orElse: () => const SizedBox(),
            );
          },
        ),
      ),
    );
  }
}
