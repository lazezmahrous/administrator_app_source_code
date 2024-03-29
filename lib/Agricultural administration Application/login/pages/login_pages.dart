import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hessen_app/Agricultural%20administration%20Application/dashboard/pages/dashboard_page.dart';
import 'package:hessen_app/Agricultural%20administration%20Application/login/cubits/login_cubit/login_cubit.dart';
import 'package:hessen_app/constanc.dart';
import 'package:hessen_app/global%20widgets/elevated_button_widget.dart';
import 'package:hessen_app/global%20widgets/text_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../global widgets/helpers/show_snack_bar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _employeEmail = TextEditingController();
  final TextEditingController _employepassword = TextEditingController();

  final GlobalKey<FormState> _formkayLogin = GlobalKey();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final loginCubit = BlocProvider.of<LoginCubit>(context);
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      progressIndicator: SpinKitPulse(
        color: Constanc.kColorGreen,
        size: 100.0,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('تسجيل الدخول'),
          centerTitle: true,
        ),
        body: BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginLoading) {
              setState(() {
                isLoading = true;
              });
            } else if (state is LoginSuccess) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            } else if (state is LoginFailure) {
              setState(() {
                isLoading = false;
              });
              if (state.errMessage == 'user-not-found') {
                showSnackBarEror(context, 'المستخدم لم يسجل من قبل', 0);
              } else if (state.errMessage == 'wrong-password') {
                showSnackBarEror(context, 'كلمه السر خطا', 0);
              }
            }
          },
          child: Form(
            key: _formkayLogin,
            child: Center(
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        child: Image.asset('assets/images/logo.jpg'),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'وزارة الزراعة',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Center(
                      child: Text(
                    'مرحبا 👋',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  )),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFieldWidget(
                    lableName: 'الإميل',
                    password: false,
                    textinput: TextInputType.emailAddress,
                    controller: _employeEmail,
                    maxLength: 60,
                    ispassword: false,
                    onTap: (data) {
                      _employeEmail.text = data!;
                      return null;
                    },
                    validator: (String? data) {
                      if (data!.isEmpty) {
                        return 'لازم تكتب إميلك';
                      } else if (data.length < 6) {
                        return 'الإسم قصير';
                      } else if (!data.contains('@gmail.com')) {
                        return 'الإميل خطا';
                      }
                      return null;
                    },
                  ),
                  TextFieldWidget(
                    lableName: 'كلمة السر',
                    password: true,
                    textinput: TextInputType.name,
                    controller: _employepassword,
                    maxLength: 16,
                    ispassword: true,
                    onTap: (data) {
                      _employepassword.text = data!;
                      return null;
                    },
                    validator: (String? data) {
                      if (data!.isEmpty) {
                        return 'لازم تكتب كلمه السر';
                      }
                      return null;
                    },
                  ),
                  ElevatedButtonWidget(
                    text: 'تسجيل الدخول',
                    onPressed: () async {
                      print(_employeEmail.value.text);
                      print(_employepassword.value.text);
                      if (_formkayLogin.currentState!.validate()) {
                        loginCubit.logIn(
                          email: _employeEmail.value.text,
                          password: _employepassword.value.text,
                        );
                      } else {}
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
