import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hessen_app/Agricultural%20administration%20Application/collect_money/cubits/the_safe_cubit/the_safe_cubit.dart';

class SafePage extends StatefulWidget {
  const SafePage({super.key});

  @override
  State<SafePage> createState() => _SafePageState();
}

class _SafePageState extends State<SafePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<TheSafeCubit>(context).getTheSafe();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الخزنة'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<TheSafeCubit, TheSafeState>(
            builder: (context, state) {
              if (state is TheSafeGetMoneyLoading) {
                return const CircularProgressIndicator();
              } else if (state is TheSafeGetMoneySuccess) {
                return Center(
                  child: Text(
                    'الخزنة ${state.theSafeMoney} جنية',
                    style: const TextStyle(
                      fontSize: 25,
                    ),
                  ),
                );
              } else {
                return const Text('حدث خطأ');
              }
            },
          ),
        ],
      ),
    );
  }
}
