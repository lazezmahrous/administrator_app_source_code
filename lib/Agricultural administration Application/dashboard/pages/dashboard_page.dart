import 'package:flutter/material.dart';
import 'package:hessen_app/Agricultural%20administration%20Application/dashboard/pages/safe_page.dart';
import 'package:hessen_app/Agricultural%20administration%20Application/get_farmer/pages/show_farmers_pages.dart';
import 'package:hessen_app/Agricultural%20administration%20Application/order_of_quantities/pages/order_of_quantities_page.dart';
import 'package:hessen_app/Agricultural%20administration%20Application/withdrawals/pages/withdrawals_page.dart';
import '../../collect_money/pages/collect_money_pages.dart';
import '../widgets/action_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> actions = [
    "توزيع كميات",
    "تحصيل فلوس",
    "مراقبه المسحوبات",
    "مراقبه الفلاحين",
    "الخزنة",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الرئيسة'),
        scrolledUnderElevation: 0,
        actions: [
          IconButton(
            onPressed: () async {
              // await FirebaseAuth.instance.signOut();
              // Navigator.pushAndRemoveUntil(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => const LoginPage(),
              //     ),
              //     (route) => false);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2,
        ),
        itemCount: actions.length,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        itemBuilder: (context, index) {
          return ActionWidget(
            actionName: actions[index],
            onTap: () {
              if (actions[index] == 'مراقبه الفلاحين') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ShowFarmersPages(),
                  ),
                );
              } else if (actions[index] == 'تحصيل فلوس') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CollectMoney(),
                  ),
                );
              } else if (actions[index] == 'الخزنة') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SafePage(),
                  ),
                );
              } else if (actions[index] == 'مراقبه المسحوبات') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WithdrawalsPage(),
                  ),
                );
              } else if (actions[index] == 'توزيع كميات') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OrderOfQuantitiesPage(),
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}
