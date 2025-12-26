import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_litera/features/transaction/domain/entities/transaction_entity.dart';

// 👇 TIDAK LAGI extends TransactionEntity
class TransactionModel {
  final String id;
  final String userId;
  final String bookId;
  final String bookTitle;
  final String bookCover;
  final String hubId;
  final int duration;
  final double totalPrice;
  final String paymentMethod;
  final String status;
  final String pickupCode;
  final DateTime orderDate;

  const TransactionModel({
    required this.id,
    required this.userId,
    required this.bookId,
    required this.bookTitle,
    required this.bookCover,
    required this.hubId,
    required this.duration,
    required this.totalPrice,
    required this.paymentMethod,
    required this.status,
    required this.pickupCode,
    required this.orderDate,
  });

  // 1. DARI FIRESTORE (Map) -> MODEL
  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      id: map['id'] ?? '',
      userId: map['userId'] ?? '',
      bookId: map['bookId'] ?? '',
      bookTitle: map['bookTitle'] ?? '',
      bookCover: map['bookCover'] ?? '',
      hubId: map['hubId'] ?? '',
      duration: (map['duration'] as num?)?.toInt() ?? 0,
      totalPrice: (map['totalPrice'] as num?)?.toDouble() ?? 0.0,
      paymentMethod: map['paymentMethod'] ?? 'CASH',
      status: map['status'] ?? 'unknown',
      pickupCode: map['pickupCode'] ?? '',
      orderDate: (map['orderDate'] as Timestamp).toDate(),
    );
  }

  // 2. DARI MODEL -> FIRESTORE (Map)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'bookId': bookId,
      'bookTitle': bookTitle,
      'bookCover': bookCover,
      'hubId': hubId,
      'duration': duration,
      'totalPrice': totalPrice,
      'paymentMethod': paymentMethod,
      'status': status,
      'pickupCode': pickupCode,
      'orderDate': Timestamp.fromDate(orderDate),
    };
  }

  // 3. DARI ENTITY (Domain) -> MODEL (Data)
  // Dipakai saat mau CREATE transaction (save ke DB)
  factory TransactionModel.fromEntity(TransactionEntity entity) {
    return TransactionModel(
      id: entity.id,
      userId: entity.userId,
      bookId: entity.bookId,
      bookTitle: entity.bookTitle,
      bookCover: entity.bookCover,
      hubId: entity.hubId,
      duration: entity.duration,
      totalPrice: entity.totalPrice,
      paymentMethod: entity.paymentMethod,
      status: entity.status,
      pickupCode: entity.pickupCode,
      orderDate: entity.orderDate,
    );
  }

  // 4. DARI MODEL (Data) -> ENTITY (Domain)
  // Dipakai saat mau MENAMPILKAN data ke UI (Get Transactions)
  TransactionEntity toEntity() {
    return TransactionEntity(
      id: id,
      userId: userId,
      bookId: bookId,
      bookTitle: bookTitle,
      bookCover: bookCover,
      hubId: hubId,
      duration: duration,
      totalPrice: totalPrice,
      paymentMethod: paymentMethod,
      status: status,
      pickupCode: pickupCode,
      orderDate: orderDate,
    );
  }
}
