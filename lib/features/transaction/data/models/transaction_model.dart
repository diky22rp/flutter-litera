import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_litera/features/transaction/domain/entities/transaction_entity.dart';

class TransactionModel {
  final String id;
  final String userId;
  final String bookId;
  final String bookTitle;
  final String bookCover;
  final String hubId;
  final String hubName;
  final int duration;
  final double totalPrice;
  final String paymentMethod;
  final String status;
  final String pickupCode;
  final DateTime orderDate;

  // 👇 FIELD BARU (Harus ada di Model juga)
  final DateTime? pickupDate;
  final DateTime? actualReturnDate;
  final double lateFee;

  const TransactionModel({
    required this.id,
    required this.userId,
    required this.bookId,
    required this.bookTitle,
    required this.bookCover,
    required this.hubId,
    required this.hubName,
    required this.duration,
    required this.totalPrice,
    required this.paymentMethod,
    required this.status,
    required this.pickupCode,
    required this.orderDate,
    this.pickupDate, // Nullable
    this.actualReturnDate, // Nullable
    this.lateFee = 0.0, // Default 0
  });

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      id: map['id'] ?? '',
      userId: map['userId'] ?? '',
      bookId: map['bookId'] ?? '',
      bookTitle: map['bookTitle'] ?? '',
      bookCover: map['bookCover'] ?? '',
      hubId: map['hubId'] ?? '',
      hubName: map['hubName'] ?? 'Lokasi Tidak Diketahui',
      duration: (map['duration'] as num?)?.toInt() ?? 0,
      totalPrice: (map['totalPrice'] as num?)?.toDouble() ?? 0.0,
      paymentMethod: map['paymentMethod'] ?? 'CASH',
      status: map['status'] ?? 'unknown',
      pickupCode: map['pickupCode'] ?? '',
      orderDate: (map['orderDate'] as Timestamp).toDate(),

      pickupDate: map['pickupDate'] != null
          ? (map['pickupDate'] as Timestamp).toDate()
          : null,
      actualReturnDate: map['actualReturnDate'] != null
          ? (map['actualReturnDate'] as Timestamp).toDate()
          : null,
      lateFee: (map['lateFee'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'bookId': bookId,
      'bookTitle': bookTitle,
      'bookCover': bookCover,
      'hubId': hubId,
      'hubName': hubName,
      'duration': duration,
      'totalPrice': totalPrice,
      'paymentMethod': paymentMethod,
      'status': status,
      'pickupCode': pickupCode,
      'orderDate': Timestamp.fromDate(orderDate),

      'pickupDate': pickupDate != null ? Timestamp.fromDate(pickupDate!) : null,
      'actualReturnDate': actualReturnDate != null
          ? Timestamp.fromDate(actualReturnDate!)
          : null,
      'lateFee': lateFee,
    };
  }

  factory TransactionModel.fromEntity(TransactionEntity entity) {
    return TransactionModel(
      id: entity.id,
      userId: entity.userId,
      bookId: entity.bookId,
      bookTitle: entity.bookTitle,
      bookCover: entity.bookCover,
      hubId: entity.hubId,
      hubName: entity.hubName,
      duration: entity.duration,
      totalPrice: entity.totalPrice,
      paymentMethod: entity.paymentMethod,
      status: entity.status,
      pickupCode: entity.pickupCode,
      orderDate: entity.orderDate,

      pickupDate: entity.pickupDate,
      actualReturnDate: entity.actualReturnDate,
      lateFee: entity.lateFee,
    );
  }

  TransactionEntity toEntity() {
    return TransactionEntity(
      id: id,
      userId: userId,
      bookId: bookId,
      bookTitle: bookTitle,
      bookCover: bookCover,
      hubId: hubId,
      hubName: hubName,
      duration: duration,
      totalPrice: totalPrice,
      paymentMethod: paymentMethod,
      status: status,
      pickupCode: pickupCode,
      orderDate: orderDate,
      pickupDate: pickupDate,
      actualReturnDate: actualReturnDate,
      lateFee: lateFee,
    );
  }
}
