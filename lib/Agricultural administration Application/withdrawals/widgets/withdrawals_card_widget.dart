// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WithdrawalsCardWidget extends StatelessWidget {
  const WithdrawalsCardWidget({
    super.key,
    required this.amount,
    required this.reason,
    required this.dataPublished,
    required this.employeName,
  });
  final double amount;
  final String reason;
  final DateTime dataPublished;
  final String employeName;
  @override
  Widget build(BuildContext context) {
    String dataPub = DateFormat('EEE, h:mm a', 'ar').format(dataPublished);

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'تم سحب  : $amount جنية',
              style: const TextStyle(
                fontSize: 25,
              ),
            ),
            Text(
              'السبب : $reason',
              style: const TextStyle(
                fontSize: 25,
              ),
            ),
            Text(
              'الوقت المسحوب فيه : $dataPub',
              style: const TextStyle(
                fontSize: 25,
              ),
            ),
            Text(
              'الموظف الذي قام بالسحب : $employeName',
              style: const TextStyle(
                fontSize: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
