
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mijoz_labbay/features/on_boarding/presentation/pages/onboarding_page.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final BuildContext context;

  LoginBloc(this.context) : super(LoginInitial()) {
    on<IsLoginEvent>(
      (event, emit) {
        if(event.phoneNum == "1"){
          FocusScope.of(context).requestFocus(FocusNode());
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const OnBoardingPage(),),);
        }else{
          emit(SignIn());
        }
      },
    );
  }
}
