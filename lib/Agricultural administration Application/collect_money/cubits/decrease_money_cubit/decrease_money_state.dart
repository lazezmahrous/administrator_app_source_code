part of 'decrease_money_cubit.dart';

@immutable
sealed class DecreaseMoneyState {}

final class DecreaseMoneyInitial extends DecreaseMoneyState {}
final class DecreaseMonyeLoading extends DecreaseMoneyState {}


final class DecreaseMonyeSuccess extends DecreaseMoneyState {

  final double newMoney;


  DecreaseMonyeSuccess({required this.newMoney});

}


final class DecreaseMonyeFailure extends DecreaseMoneyState {

  final String errMessage;


  DecreaseMonyeFailure({required this.errMessage});

}
