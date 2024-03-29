part of 'get_withdrawals_cubit.dart';


@immutable

sealed class GetWithdrawalsState {}


final class GetWithdrawalsInitial extends GetWithdrawalsState {}


final class GetWithdrawalsLoading extends GetWithdrawalsState {}


final class GetWithdrawalsSuccess extends GetWithdrawalsState {

  final QuerySnapshot<Map<String, dynamic>> withdrawals;


  GetWithdrawalsSuccess({required this.withdrawals});

}


final class GetWithdrawalsFailure extends GetWithdrawalsState {

  final String errMessage;


  GetWithdrawalsFailure({required this.errMessage});

}

