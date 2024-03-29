import 'package:bloc/bloc.dart';


import 'package:cloud_firestore/cloud_firestore.dart';


import 'package:meta/meta.dart';


import 'package:shared_preferences/shared_preferences.dart';


part 'decrease_money_state.dart';


class DecreaseMoneyCubit extends Cubit<DecreaseMoneyState> {

  DecreaseMoneyCubit() : super(DecreaseMoneyInitial());


  Future<void> decreaseMoney({

    required String centerName,

    required String association,

    required double newMoney,

    required double oldMoney,

    required String reason,

    required double monyDecrease,

  }) async {

    emit(DecreaseMonyeLoading());


    print(newMoney);

    print(oldMoney);


    try {

      await FirebaseFirestore.instance

          .collection(centerName)

          .doc(association)

          .update({

        "money": newMoney,

      });


      final SharedPreferences prefs = await SharedPreferences.getInstance();


      if (prefs.getDouble('myMoney') == null) {

        prefs.setDouble("myMoney", 0);

      } else {

        double? oldMoney = prefs.getDouble("myMoney");


        double? orignalMoney = monyDecrease + oldMoney!;


        prefs.setDouble('myMoney', orignalMoney);

      }


      await FirebaseFirestore.instance

          .collection(centerName)

          .doc(association)

          .collection('withdrawals')

          .doc()

          .set({

        "amount": oldMoney,

        "reason": reason,

        "employeName": 'hessen',

        "dataPublished": DateTime.now(),

      });


      emit(DecreaseMonyeSuccess(newMoney: newMoney));

    } catch (e) {

      emit(DecreaseMonyeFailure(errMessage: e.toString()));


      print(e.toString());

    }

  }

}

