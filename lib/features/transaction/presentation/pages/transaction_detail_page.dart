import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_litera/core/constants/app_colors.dart';
import 'package:flutter_litera/core/presentation/widgets/transaction_item_card.dart';
import 'package:flutter_litera/core/presentation/widgets/transaction_payment_summary.dart';
import 'package:flutter_litera/core/presentation/widgets/transaction_status_badge.dart';
import 'package:flutter_litera/features/transaction/domain/entities/transaction_entity.dart';
import 'package:url_launcher/url_launcher.dart';

class TransactionDetailPage extends StatelessWidget {
  final TransactionEntity transaction;

  const TransactionDetailPage({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          "Detail Pesanan",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Center(child: TransactionStatusBadge(status: transaction.status)),
            const SizedBox(height: 20),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.primary.withAlpha(128)),
              ),
              child: Column(
                children: [
                  const Text(
                    "KODE PICK-UP",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    transaction.pickupCode,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Tunjukkan kode ini kepada petugas",
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            TransactionItemCard(transaction: transaction, showStatus: false),

            const SizedBox(height: 20),

            TransactionPaymentSummary(
              transaction: transaction,
              showTitle: true,
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton.icon(
                onPressed: () async {
                  final String adminNumber =
                      dotenv.env['ADMIN_WA_NUMBER'] ?? '6289699107265';

                  final String message = Uri.encodeComponent(
                    "Hi Mimin Litera, saya butuh bantuan terkait pesanan ${transaction.pickupCode}",
                  );

                  final Uri url = Uri.parse(
                    "https://wa.me/$adminNumber?text=$message",
                  );

                  try {
                    if (!await launchUrl(
                      url,
                      mode: LaunchMode.externalApplication,
                    )) {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Gagal membuka WhatsApp"),
                          ),
                        );
                      }
                    }
                  } catch (e) {
                    debugPrint("Error launch WA: $e");
                  }
                },
                icon: const Icon(Icons.help_outline),
                label: const Text("Butuh Bantuan?"),
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
