import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hessen_app/Agricultural%20administration%20Application/collect_money/cubits/collect_money_cubit/collect_money_cubit.dart';
import 'package:hessen_app/Agricultural%20administration%20Application/collect_money/widgets/show_money_widget.dart';

class GetMonyWidget extends StatelessWidget {
  const GetMonyWidget({
    super.key,
    required this.centerName,
    required this.association,
  });
  final String centerName;
  final String association;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CollectMoneyCubit, CollectMoneyState>(
      builder: (context, state) {
        if (state is CollectMoneyLoading) {
          return const CircularProgressIndicator();
        } else if (state is CollectMoneySuccess) {
          return FutureBuilder(
            future: state.moneyData,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              } else {}
              return ShowMoneyWidget(
                money: snapshot.data!.data()!['money'].toString(),
                centerName: centerName,
                association: association,
              );
            },
          );
        } else if (state is CollectMoneyFailure) {
          return Text('حدث خطأ ${state.errMessage}');
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
