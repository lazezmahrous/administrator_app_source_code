part of 'agricultural_society_cubit.dart';


@immutable

sealed class AgriculturalSocietyState {}


final class AgriculturalSocietyInitial extends AgriculturalSocietyState {}


final class GetDataLoading extends AgriculturalSocietyState {}


final class GetDataSuccess extends AgriculturalSocietyState {

  final QuerySnapshot<Map<String, dynamic>> data;


  GetDataSuccess({required this.data});

}


final class GetDataFailure extends AgriculturalSocietyState {

  final String errMessage;


  GetDataFailure({required this.errMessage});

}

