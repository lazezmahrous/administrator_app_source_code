import 'package:flutter/material.dart';
import 'package:hessen_app/Agricultural%20administration%20Application/get_farmer/models/farmer_model.dart';
import 'package:hessen_app/constanc.dart';
import 'package:hessen_app/global%20widgets/helpers/show_snack_bar.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class ShowFarmerWidget extends StatelessWidget {
  const                                                                ShowFarmerWidget({super.key, required this.farmer});
  final FarmerModel farmer;
  @override
  Widget build(BuildContext context) {
    String dataPublished =
        DateFormat('EEE, h:mm a', 'ar').format(farmer.dataPublished.toDate());

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(' الإسم : ${farmer.name}'),
                Text(' رقم الهاتف : ${farmer.phoneNumber}'),
                Text('  الكميه: ${farmer.amount}'),
                Text('  إسم الصنف: ${farmer.amountCategory}'),
                Text(' المبلغ المدفوع: ${farmer.amountPaid.toString()} جنيه'),
                Text(' الموظف المسجل لهذا الفلاح: ${farmer.publisher}'),
                Text(' وقت تسجبل هذا الفلاح: $dataPublished'),
              ],
            ),
            const Spacer(),
            IconButton(
              onPressed: () async {
                try {
                  await launch("tel:+20${farmer.phoneNumber}");
                } catch (e) {
                  showSnackBarEror(context, e.toString(), 0);
                }
              },
              icon: Icon(
                Icons.call,
                color: Constanc.kColorGreen,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
