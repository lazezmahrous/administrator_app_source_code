import 'package:flutter/material.dart';
import 'collect_money_widget.dart';

class ShowMoneyWidget extends StatelessWidget {
  const ShowMoneyWidget({
    super.key,
    required this.money,
    required this.centerName,
    required this.association,
  });
  final String money;
  final String centerName;
  final String association;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'المبلغ المتاح $money جنية',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    useSafeArea: true,
                    context: context,
                    builder: (context) {
                      return CollectMoneyWidget(
                        money: money,
                        centerName: centerName,
                        association: association,
                      );
                    },
                  );
                },
                child: const Text(
                  'سحب',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
