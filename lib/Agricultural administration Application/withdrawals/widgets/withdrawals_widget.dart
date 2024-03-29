import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hessen_app/Agricultural%20administration%20Application/withdrawals/cubits/get_withdrawals_cubit/get_withdrawals_cubit.dart';
import 'package:hessen_app/Agricultural%20administration%20Application/withdrawals/widgets/withdrawals_card_widget.dart';

class WithdrawalsWidget extends StatelessWidget {
  const WithdrawalsWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWithdrawalsCubit, GetWithdrawalsState>(
      builder: (context, state) {
        if (state is GetWithdrawalsLoading) {
          return const CircularProgressIndicator();
        } else if (state is GetWithdrawalsSuccess) {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            itemCount: state.withdrawals.docs.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final ref = state.withdrawals.docs[index];
              return WithdrawalsCardWidget(
                amount: double.tryParse(ref['amount'].toString()) ?? 0.0,
                reason: ref['reason'],
                dataPublished: ref['dataPublished'].toDate(),
                employeName: ref['employeName'],
              );
            },
          );
        } else {
          return const Text('حدث خطا');
        }
      },
    );
  }
}
