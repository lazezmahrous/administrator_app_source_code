part of 'the_safe_cubit.dart';


@immutable

sealed class TheSafeState {}


final class TheSafeInitial extends TheSafeState {}


final class TheSafeGetMoneyLoading extends TheSafeState {}


final class TheSafeGetMoneySuccess extends TheSafeState {

  final double theSafeMoney;

  TheSafeGetMoneySuccess({required this.theSafeMoney});

}


final class TheSafeGetMoneyFailure extends TheSafeState {}

