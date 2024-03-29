// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class FarmerModel {
  final String name;
  final String phoneNumber;
  final String amount;
  final String amountCategory;
  final String amountPaid;
  final String publisher;
  final Timestamp dataPublished;
  FarmerModel({
    required this.name,
    required this.phoneNumber,
    required this.amount,
    required this.amountCategory,
    required this.amountPaid,
    required this.publisher,
    required this.dataPublished,
  });
}
