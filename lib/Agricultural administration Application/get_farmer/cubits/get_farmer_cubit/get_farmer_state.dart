part of 'get_farmer_cubit.dart';


@immutable

sealed class GetFarmerState {}


final class GetFarmerInitial extends GetFarmerState {}


final class GetFarmerLoading extends GetFarmerState {}


final class GetFarmerSuccess extends GetFarmerState {

  final Future<QuerySnapshot<Map<String, dynamic>>> farmersData;


  GetFarmerSuccess({required this.farmersData});

}


final class GetFarmerFailure extends GetFarmerState {

  final String errMessage;


  GetFarmerFailure({required this.errMessage});

}

