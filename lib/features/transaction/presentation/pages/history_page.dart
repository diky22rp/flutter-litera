import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_litera/core/constants/app_colors.dart';
import 'package:flutter_litera/features/transaction/domain/entities/transaction_entity.dart';
import 'package:flutter_litera/features/transaction/presentation/bloc/history/bloc/history_bloc.dart';
import 'package:flutter_litera/injection.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<HistoryBloc>()..add(const HistoryEvent.fetchHistory()),
      child: Scaffold(
        backgroundColor: AppColors.background, // Sesuaikan warna backgroundmu
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
                    return _buildTransactionCard(context, trx);
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

  Widget _buildTransactionCard(BuildContext context, TransactionEntity trx) {
    final dateFormat = DateFormat('dd MMM yyyy, HH:mm');
    final currencyFormat = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );

    return InkWell(
      onTap: () {
        context.pushNamed('transaction-detail', extra: trx);
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Gambar Cover Kecil
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: trx.bookCover,
                width: 60,
                height: 90,
                fit: BoxFit.cover,
                errorWidget: (_, __, ___) => Container(color: Colors.grey),
              ),
            ),

            const SizedBox(width: 12),

            // 2. Info Transaksi
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tanggal & Status
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        dateFormat.format(trx.orderDate),
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      ),
                      _buildStatusBadge(trx.status),
                    ],
                  ),
                  const SizedBox(height: 4),

                  // Judul Buku
                  Text(
                    trx.bookTitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Harga & Kode Pickup
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        currencyFormat.format(trx.totalPrice),
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.textMain,
                        ),
                      ),

                      // KODE PICKUP (PENTING)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.background,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: AppColors.border),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.confirmation_number,
                              size: 12,
                              color: AppColors.primary,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              trx.pickupCode,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusBadge(String status) {
    Color color;
    String text;

    switch (status) {
      case 'waiting_pickup':
        color = Colors.orange;
        text = "Menunggu Diambil";
        break;
      case 'active':
        color = Colors.blue;
        text = "Sedang Dipinjam";
        break;
      case 'completed':
        color = Colors.green;
        text = "Selesai";
        break;
      default:
        color = Colors.grey;
        text = status;
    }

    return Text(
      text,
      style: TextStyle(fontSize: 10, color: color, fontWeight: FontWeight.bold),
    );
  }
}
