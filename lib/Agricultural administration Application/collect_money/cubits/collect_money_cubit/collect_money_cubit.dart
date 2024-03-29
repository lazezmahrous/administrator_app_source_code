import 'package:bloc/bloc.dart';


import 'package:cloud_firestore/cloud_firestore.dart';


import 'package:meta/meta.dart';


part 'collect_money_state.dart';


class CollectMoneyCubit extends Cubit<CollectMoneyState> {

  final ref = FirebaseFirestore.instance;


  CollectMoneyCubit() : super(CollectMoneyInitial());


  Future<void> collectMoney(

      {required String centerName, required String association}) async {

    emit(CollectMoneyLoading());

    try {

      Future<DocumentSnapshot<Map<String, dynamic>>> moneyData =

          ref.collection(centerName).doc(association).get();


      emit(CollectMoneySuccess(moneyData: moneyData));

    } catch (e) {

      emit(CollectMoneyFailure(errMessage: e.toString()));

    }

  }

}

