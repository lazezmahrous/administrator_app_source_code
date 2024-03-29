part of 'collect_money_cubit.dart';


@immutable

sealed class CollectMoneyState {}


final class CollectMoneyInitial extends CollectMoneyState {}


final class CollectMoneyLoading extends CollectMoneyState {}


final class CollectMoneySuccess extends CollectMoneyState {

  final Future<DocumentSnapshot<Map<String, dynamic>>> moneyData;


  CollectMoneySuccess({required this.moneyData});

}


final class CollectMoneyFailure extends CollectMoneyState {

  final String errMessage;


  CollectMoneyFailure({required this.errMessage});

}

