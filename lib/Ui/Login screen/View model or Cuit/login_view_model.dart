import 'package:commerce_app_project/Domain/repository/repositry/auth_repositry_contract.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Domain/use cases/login_use_case.dart';
import 'login_states.dart';

class LoginViewModel extends Cubit<LoginStates> {
  LoginViewModel({required this.loginUseCase}) : super(LoginIntialState());

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  LoginUseCase loginUseCase;
  AuthRepositryContract? repositoryContract;

  void Login() async {
    if (formKey.currentState?.validate() == true) {
      emit(LoginLoadingState(loadingMessage: "loading....."));
      var either = await loginUseCase.invoke(
          emailController.text, passwordController.text);
      either.fold(
        (l) {
          emit(LoginErrorState(errorMessage: l.errorMessage));
        },
        (r) {
          emit(LoginSuccessState(response: r));
        },
      );
    }
  }
}
