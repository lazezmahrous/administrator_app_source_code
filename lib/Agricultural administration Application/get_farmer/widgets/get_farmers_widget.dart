import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hessen_app/Agricultural%20administration%20Application/get_farmer/cubits/get_farmer_cubit/get_farmer_cubit.dart';
import 'package:hessen_app/Agricultural%20administration%20Application/get_farmer/models/farmer_model.dart';

import 'show_farmer_widget.dart';

class GetFarmersWidget extends StatelessWidget {
  const GetFarmersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SizedBox(
      height: height - 100,
      width: width - 50,
      child: BlocBuilder<GetFarmerCubit, GetFarmerState>(
        builder: (context, state) {
          if (state is GetFarmerLoading) {
            return const CircularProgressIndicator();
          } else if (state is GetFarmerSuccess) {
            return FutureBuilder(
              future: state.farmersData,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                } else {}
                return ListView.builder(
                  reverse: true,
                  shrinkWrap: false,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var ref = snapshot.data!.docs[index];
                    return ShowFarmerWidget(
                      farmer: FarmerModel(
                        name: ref['username'],
                        phoneNumber: ref['phoneNumber'],
                        amount: ref['amount'],
                        amountCategory: ref['amountCategory'],
                        amountPaid: ref['amountPaid'].toString(),
                        publisher: ref['publisher'],
                        dataPublished: ref['dataPublisher'] as Timestamp,
                      ),
                    );
                  },
                );
              },
            );
          } else if (state is GetFarmerFailure) {
            return Text('حدث خطأ ${state.errMessage}');
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
