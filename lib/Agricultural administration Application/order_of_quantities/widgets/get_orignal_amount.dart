import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hessen_app/Agricultural%20administration%20Application/order_of_quantities/widgets/show_Items_widget.dart';
import '../cubits/agricultural_society_cubit/agricultural_society_cubit.dart';

class GetOrignalItemsWidget extends StatelessWidget {
  const GetOrignalItemsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => AgriculturalSocietyCubit()..getData(),
      child: BlocBuilder<AgriculturalSocietyCubit, AgriculturalSocietyState>(
        builder: (context, state) {
          if (state is GetDataLoading) {
            return const CircularProgressIndicator();
          } else if (state is GetDataSuccess) {
            return SizedBox(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: screenWidth - 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              BlocProvider.of<AgriculturalSocietyCubit>(context)
                                  .getData();
                            },
                            child: const Text(
                              'تحديث',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: screenWidth - 60,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: state.data.docs.length,
                          itemBuilder: (context, index) {
                            return ShowItemsWidget(
                              itemName: state.data.docs[index]['name'],
                              itemamount: state.data.docs[index]['amount'],
                              
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (state is GetDataFailure) {
            return Text('حدث خطأ ${state.errMessage}');
          }
          return const SizedBox();
        },
      ),
    );
  }
}
