import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hessen_app/Agricultural%20administration%20Application/collect_money/cubits/decrease_money_cubit/decrease_money_cubit.dart';

import '../../../global widgets/elevated_button_widget.dart';
import '../../../global widgets/text_field.dart';

class CollectMoneyWidget extends StatelessWidget {
  const CollectMoneyWidget({
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
    final TextEditingController reason = TextEditingController();
    final TextEditingController monyDecrease = TextEditingController();
    final GlobalKey<FormState> formkay = GlobalKey();

    return SafeArea(
      child: Form(
        key: formkay,
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          children: [
            TextFieldWidget(
              lableName: 'سبب السحب',
              password: false,
              textinput: TextInputType.name,
              controller: reason,
              maxLength: 60,
              ispassword: false,
              onTap: (data) {
                reason.text = data!;
                return null;
              },
              validator: (data) {
                if (data!.isEmpty) {
                  return 'لازم تكتب السبب';
                } else {}
                return null;
              },
            ),
            TextFieldWidget(
              lableName: 'المبلغ المسحوب',
              password: false,
              textinput: TextInputType.name,
              controller: monyDecrease,
              maxLength: 60,
              ispassword: false,
              onTap: (data) {
                monyDecrease.text = data!;
                return null;
              },
              validator: (data) {
                if (data!.isEmpty) {
                  return 'لازم تكتب المبلغ المسحوب';
                } else {}
                return null;
              },
            ),
            ElevatedButtonWidget(
              onPressed: () async {
                if (formkay.currentState!.validate()) {
                  double orignalMoney = double.parse(money);
                  double newMoney =
                      orignalMoney - double.parse(monyDecrease.value.text);
                  await BlocProvider.of<DecreaseMoneyCubit>(context)
                      .decreaseMoney(
                    centerName: centerName,
                    association: association,
                    newMoney: newMoney,
                    oldMoney: orignalMoney,
                    reason: reason.value.text,
                    monyDecrease: double.parse(monyDecrease.value.text),
                  );
                  print(newMoney);
                } else {}
              },
              text: 'سحب المبلغ',
            ),
          ],
        ),
      ),
    );
  }
}
