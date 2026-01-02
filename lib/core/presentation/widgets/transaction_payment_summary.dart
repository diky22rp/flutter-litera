import 'package:flutter/material.dart';
import 'package:flutter_litera/core/constants/app_colors.dart';
import 'package:flutter_litera/features/transaction/domain/entities/transaction_entity.dart';
import 'package:intl/intl.dart';

class TransactionPaymentSummary extends StatelessWidget {
  final TransactionEntity transaction;
  final bool showTitle;

  const TransactionPaymentSummary({
    super.key,
    required this.transaction,
    this.showTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    final dateFormat = DateFormat('dd MMMM yyyy, HH:mm', 'id_ID');
    final shortDateFormat = DateFormat('dd MMMM yyyy', 'id_ID');

    final double grandTotal = transaction.totalPrice + transaction.lateFee;
    final bool hasFine = transaction.lateFee > 0;

    DateTime? dueDate;
    if (transaction.pickupDate != null) {
      dueDate = transaction.pickupDate!.add(
        Duration(days: transaction.duration),
      );
    }

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showTitle) ...[
            const Text(
              "Rincian Transaksi",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 16),
          ],

          _buildRow("Tanggal Order", dateFormat.format(transaction.orderDate)),
          _buildRow("Metode Bayar", transaction.paymentMethod),

          if (transaction.pickupDate != null) ...[
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Divider(height: 1, thickness: 0.5, color: Colors.grey),
            ),
            _buildRow(
              "Tanggal Ambil",
              shortDateFormat.format(transaction.pickupDate!),
            ),

            _buildRow(
              "Batas Pengembalian",
              shortDateFormat.format(dueDate!),
              valueColor: (transaction.actualReturnDate == null)
                  ? Colors.red
                  : Colors.black,
            ),

            if (transaction.actualReturnDate != null)
              _buildRow(
                "Tanggal Dikembalikan",
                shortDateFormat.format(transaction.actualReturnDate!),
              ),
          ],

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Divider(),
          ),

          _buildRow(
            "Biaya Sewa",
            currencyFormat.format(transaction.totalPrice),
          ),

          if (hasFine) ...[
            const SizedBox(height: 4),
            _buildRow(
              "Denda Keterlambatan",
              "+ ${currencyFormat.format(transaction.lateFee)}",
              valueColor: Colors.red,
              isBold: true,
            ),
          ],

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Divider(height: 1, thickness: 1),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Total Bayar",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                currencyFormat.format(grandTotal),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: AppColors.success,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRow(
    String label,
    String value, {
    Color? valueColor,
    bool isBold = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 13)),
          Text(
            value,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
              fontSize: 13,
              color: valueColor ?? Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
