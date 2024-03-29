import 'package:flutter/material.dart';

class ShowItemsWidget extends StatelessWidget {
  const ShowItemsWidget(
      {super.key, required this.itemName, required this.itemamount});
  final String itemName;
  final String itemamount;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Text('إسم الصنف : $itemName'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text('الكمية : $itemamount'),
            ),
          ],
        ),
      ),
    );
  }
}
