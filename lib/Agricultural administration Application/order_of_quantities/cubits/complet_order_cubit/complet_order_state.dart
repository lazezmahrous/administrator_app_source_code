part of 'complet_order_cubit.dart';


@immutable

sealed class CompletOrderState {}


final class CompletOrderInitial extends CompletOrderState {}


final class CompletOrderLoading extends CompletOrderState {}


final class CompletOrderSuccess extends CompletOrderState {}


final class CompletOrderFailure extends CompletOrderState {}

