import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_litera/core/constants/app_colors.dart';
import 'package:flutter_litera/core/presentation/widgets/transaction_item_card.dart';
import 'package:flutter_litera/core/presentation/widgets/transaction_payment_summary.dart';
import 'package:flutter_litera/features/admin/presentation/cubit/admin_transaction_cubit.dart';
import 'package:flutter_litera/features/transaction/domain/entities/transaction_entity.dart';
import 'package:flutter_litera/injection.dart';
import 'package:intl/intl.dart';

class AdminHubPage extends StatelessWidget {
  const AdminHubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AdminTransactionCubit>(),
      child: const _AdminHubView(),
    );
  }
}

class _AdminHubView extends StatefulWidget {
  const _AdminHubView();

  @override
  State<_AdminHubView> createState() => _AdminHubViewState();
}

class _AdminHubViewState extends State<_AdminHubView> {
  final _codeController = TextEditingController();

  void _showReturnConfirmation(BuildContext context, TransactionEntity order) {
    final preview = context
        .read<AdminTransactionCubit>()
        .calculatePenaltyPreview(order);

    final DateTime pickupDate = preview['pickupDate'];
    final DateTime dueDate = preview['dueDate'];
    final DateTime returnDate = preview['returnDate'];
    final int overdueDays = preview['overdueDays'];
    final double finePerDay = preview['finePerDay'];
    final double totalFine = preview['totalFine'];

    final currencyFormat = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    final dateFormat = DateFormat('dd MMM yyyy', 'id_ID');

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Konfirmasi Pengembalian"),
        content: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Pastikan buku yang dikembalikan dalam kondisi baik.",
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
                const Divider(),

                const Text(
                  "Rincian Waktu:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                _buildDetailRow("Tanggal Ambil", dateFormat.format(pickupDate)),
                _buildDetailRow("Durasi Sewa", "${order.duration} Hari"),
                _buildDetailRow(
                  "Jatuh Tempo",
                  dateFormat.format(dueDate),
                  isBold: true,
                ),
                _buildDetailRow("Dikembalikan", dateFormat.format(returnDate)),

                const Divider(),

                if (overdueDays > 0) ...[
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.red.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.warning_amber_rounded,
                          color: Colors.red,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            "TELAT $overdueDays HARI",
                            style: const TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildDetailRow(
                    "Denda per hari",
                    currencyFormat.format(finePerDay),
                  ),
                  _buildDetailRow(
                    "Total Denda",
                    currencyFormat.format(totalFine),
                    isBold: true,
                    color: Colors.red,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "⚠️ Tagih denda kepada penyewa SEBELUM menekan tombol Selesai.",
                    style: TextStyle(
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                      color: Colors.grey,
                    ),
                  ),
                ] else ...[
                  const SizedBox(height: 10),
                  Row(
                    children: const [
                      Icon(Icons.check_circle, color: Colors.green),
                      SizedBox(width: 8),
                      Text(
                        "Pengembalian Tepat Waktu.",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    "Tidak ada denda yang perlu ditagih.",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text("Batal"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
            onPressed: () {
              Navigator.pop(ctx);
              context.read<AdminTransactionCubit>().updateStatus(
                order,
                'completed',
              );
            },
            child: const Text(
              "Selesaikan",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(
    String label,
    String value, {
    bool isBold = false,
    Color? color,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 13, color: Colors.black87),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 13,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: color ?? Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cek Transaksi"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _codeController,
              decoration: InputDecoration(
                labelText: "Masukkan Kode Pickup",
                hintText: "Contoh: #A8B2",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    if (_codeController.text.isNotEmpty) {
                      context.read<AdminTransactionCubit>().findTransaction(
                        _codeController.text,
                      );
                    }
                  },
                ),
              ),
              onSubmitted: (val) {
                if (val.isNotEmpty) {
                  context.read<AdminTransactionCubit>().findTransaction(val);
                }
              },
            ),

            const SizedBox(height: 20),

            Expanded(
              child: BlocConsumer<AdminTransactionCubit, AdminTransactionState>(
                listener: (context, state) {
                  if (state is AdminTxSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.msg),
                        backgroundColor: Colors.green,
                        duration: const Duration(seconds: 4),
                      ),
                    );
                    _codeController.clear();
                    context.read<AdminTransactionCubit>().reset();
                  }
                  if (state is AdminTxError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.msg),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is AdminTxLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is AdminTxFound) {
                    return _buildOrderCard(context, state.order);
                  }

                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.qr_code_scanner,
                          size: 80,
                          color: Colors.grey[300],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "Scan atau ketik kode untuk memulai.",
                          style: TextStyle(color: Colors.grey[400]),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderCard(BuildContext context, TransactionEntity order) {
    String btnText = "";
    bool isActionable = false;

    if (order.status == 'waiting_pickup') {
      btnText = "Konfirmasi Pengambilan Barang";
      isActionable = true;
    } else if (order.status == 'active') {
      btnText = "Cek Denda & Selesaikan";
      isActionable = true;
    } else if (order.status == 'completed') {
      isActionable = false;
    }

    final currencyFormat = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );

    return SingleChildScrollView(
      child: Column(
        children: [
          TransactionItemCard(transaction: order, showStatus: true),

          const SizedBox(height: 16),

          TransactionPaymentSummary(transaction: order, showTitle: false),

          const SizedBox(height: 24),

          if (isActionable)
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (order.status == 'waiting_pickup') {
                    // Start Sewa (Update ke Active)
                    context.read<AdminTransactionCubit>().updateStatus(
                      order,
                      'active',
                    );
                  } else if (order.status == 'active') {
                    _showReturnConfirmation(context, order);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  btnText,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          else
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.green.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.green.withValues(alpha: 0.3)),
              ),
              child: Column(
                children: [
                  const Text(
                    "Transaksi Selesai",
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  if (order.lateFee > 0)
                    Text(
                      "(Ada Denda: ${currencyFormat.format(order.lateFee)})",
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
