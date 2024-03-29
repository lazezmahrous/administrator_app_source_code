import 'package:bloc/bloc.dart';



import 'package:firebase_auth/firebase_auth.dart';


import 'package:meta/meta.dart';


part 'login_state.dart';


class LoginCubit extends Cubit<LoginState> {

  LoginCubit() : super(LoginInitial());


  Future<void> logIn({required String email, required String password}) async {

    emit(
      LoginLoading(),
    );


    try {

      FirebaseAuth.instance

          .signInWithEmailAndPassword(email: email, password: password);


      emit(

        LoginSuccess(),

      );

    } catch (e) {

      emit(

        LoginFailure(errMessage: e.toString()),

      );

    }

  }

}

