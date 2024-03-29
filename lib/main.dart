import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hessen_app/Agricultural%20administration%20Application/collect_money/cubits/collect_money_cubit/collect_money_cubit.dart';
import 'package:hessen_app/Agricultural%20administration%20Application/collect_money/cubits/the_safe_cubit/the_safe_cubit.dart';
import 'package:hessen_app/Agricultural%20administration%20Application/get_farmer/cubits/get_farmer_cubit/get_farmer_cubit.dart';
import 'package:hessen_app/Agricultural%20administration%20Application/dashboard/pages/splash_page.dart';
import 'package:hessen_app/Agricultural%20administration%20Application/login/cubits/login_cubit/login_cubit.dart';
import 'package:hessen_app/Agricultural%20administration%20Application/order_of_quantities/cubits/agricultural_society_cubit/agricultural_society_cubit.dart';
import 'package:hessen_app/Agricultural%20administration%20Application/withdrawals/cubits/get_withdrawals_cubit/get_withdrawals_cubit.dart';
import 'package:hessen_app/constanc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'Agricultural administration Application/collect_money/cubits/decrease_money_cubit/decrease_money_cubit.dart';
import 'Agricultural administration Application/order_of_quantities/cubits/complet_order_cubit/complet_order_cubit.dart';
import 'firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await Hive.box(Constanc.kFarmersBox).clear();
  await Hive.initFlutter();

  // Hive.registerAdapter(FarmerModelAdapter());
  // await Hive.openBox<FarmerModel>(Constanc.kFarmersBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => GetFarmerCubit(),
        ),
        BlocProvider(
          create: (context) => CollectMoneyCubit(),
        ),
        BlocProvider(
          create: (context) => DecreaseMoneyCubit(),
        ),
        BlocProvider(
          create: (context) => TheSafeCubit(),
        ),
        BlocProvider(
          create: (context) => GetWithdrawalsCubit(),
        ),
        BlocProvider(
          create: (context) => AgriculturalSocietyCubit(),
        ),
        BlocProvider(
          create: (context) => CompletOrderCubit(),
        ),

        // BlocProvider(
        //   create: (context) => EmployeCubit()..getEmployeDetails(),
        // ),
        // BlocProvider(
        //   create: (context) => SignUpCubit(),
        // ),
        // BlocProvider(
        //   create: (context) => MonyCubit(),
        // ),
        // BlocProvider(
        //   create: (context) => AgriculturalSocietyCubit()..getAmount(),
        // ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ar'),
        ],
        locale: const Locale('ar'),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Constanc.kColorGreen),
          fontFamily: 'Cairo',
          useMaterial3: true,
        ),
        home: const SplashPage(),
      ),
    );
  }
}
