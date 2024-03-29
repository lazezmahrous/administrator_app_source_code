// // ignore_for_file: must_be_immutable

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hessen_app/Association%20application/home%20and%20employe%20dashboard/cubits/mony_cubit/mony_cubit.dart';

// class GetMonyWidget extends StatefulWidget {
//   GetMonyWidget(
//       {super.key,
//       required this.employeCenterName,
//       required this.employeAssociation});
//   String? employeCenterName;
//   String? employeAssociation;
//   @override
//   State<GetMonyWidget> createState() => _GetMonyWidgetState();
// }

// class _GetMonyWidgetState extends State<GetMonyWidget> {
//   @override
//   void initState() {
//     BlocProvider.of<MonyCubit>(context).getMoney(
//       employeCenterName: widget.employeCenterName!,
//       employeAssociation: widget.employeAssociation!,
//     );
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<MonyCubit, MonyState>(
//       builder: (context, state) {
//         if (state is GetMonyeLoading) {
//           return const CircularProgressIndicator.adaptive();
//         } else if (state is GetMonyeSuccess) {
//           return Text(
//             'الخزنة : ${state.money} جنيه',
//             style: const TextStyle(
//               fontSize: 20,
//             ),
//           );
//         } else {
//           return const Text('حدث خطأ');
//         }
//       },
//     );
//   }
// }
