import 'package:bloc/bloc.dart';


import 'package:cloud_firestore/cloud_firestore.dart';


import 'package:meta/meta.dart';


part 'get_farmer_state.dart';


class GetFarmerCubit extends Cubit<GetFarmerState> {

  final ref = FirebaseFirestore.instance;


  GetFarmerCubit() : super(GetFarmerInitial());


  Future<void> getFarmersWithEmployeCenterName(

      {required String centerName}) async {

    emit(GetFarmerLoading());


    try {

      Future<QuerySnapshot<Map<String, dynamic>>> farmersData = ref

          .collection('farmers')

          .where("employeCenterName", isEqualTo: centerName)

          .get();


      emit(GetFarmerSuccess(farmersData: farmersData));

    } catch (e) {

      emit(GetFarmerFailure(errMessage: e.toString()));

    }

  }


  Future<void> getFarmersWithEmployeCenterNameAndAssociationName(

      {required String centerName, required String associationName}) async {

    emit(GetFarmerLoading());


    try {
      Future<QuerySnapshot<Map<String, dynamic>>> farmersData = ref

          .collection('farmers')

          .where("employeCenterName", isEqualTo: centerName)

          .where('employeAssociation', isEqualTo: associationName)

          .get();

      emit(GetFarmerSuccess(farmersData: farmersData));

    } catch (e) {}

  }

}

