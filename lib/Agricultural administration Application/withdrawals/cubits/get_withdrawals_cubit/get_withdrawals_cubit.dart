import 'package:bloc/bloc.dart';


import 'package:cloud_firestore/cloud_firestore.dart';


import 'package:meta/meta.dart';


part 'get_withdrawals_state.dart';


class GetWithdrawalsCubit extends Cubit<GetWithdrawalsState> {

  GetWithdrawalsCubit() : super(GetWithdrawalsInitial());


  Future getWithdrawals(

      {required String centerName, required String association}) async {

    emit(GetWithdrawalsLoading());


    try {

      QuerySnapshot<Map<String, dynamic>> withdrawals = await FirebaseFirestore

          .instance

          .collection(centerName)

          .doc(association)

          .collection('withdrawals')

          .get();


      emit(
        GetWithdrawalsSuccess(
          withdrawals: withdrawals,
        ),
      );

    } catch (e) {

      emit(

        GetWithdrawalsFailure(

          errMessage: e.toString(),

        ),

      );

    }

  }

}

