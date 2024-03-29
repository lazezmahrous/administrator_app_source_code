import 'package:bloc/bloc.dart';


import 'package:meta/meta.dart';


import 'package:shared_preferences/shared_preferences.dart';


part 'the_safe_state.dart';


class TheSafeCubit extends Cubit<TheSafeState> {

  TheSafeCubit() : super(TheSafeInitial());


  Future<void> getTheSafe() async {

    final prefs = await SharedPreferences.getInstance();


    if (prefs.getDouble("myMoney") == null) {

      prefs.setDouble("myMoney", 0);


      emit(TheSafeGetMoneySuccess(

        theSafeMoney: prefs.getDouble("myMoney")!.toDouble(),

      ));

    } else {
      emit(TheSafeGetMoneySuccess(

        theSafeMoney: prefs.getDouble("myMoney")!.toDouble(),

      ));

    }

  }

}

