import 'package:flutter/material.dart';

class TransactionStatusBadge extends StatelessWidget {
  final String status;

  const TransactionStatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    Color color;
    String text;
    IconData icon;

    switch (status) {
      case 'waiting_pickup':
        color = Colors.orange;
        text = "Menunggu Diambil";
        icon = Icons.access_time_filled;
        break;
      case 'active':
        color = Colors.blue;
        text = "Sedang Dipinjam";
        icon = Icons.book;
        break;
      case 'completed':
        color = Colors.green;
        text = "Selesai";
        icon = Icons.check_circle;
        break;
      default:
        color = Colors.grey;
        text = status.toUpperCase();
        icon = Icons.info;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 16),
          const SizedBox(width: 6),
          Text(
            text,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
