import 'package:commerce_app_project/Domain/repository/repositry/auth_repositry_contract.dart';
import 'package:commerce_app_project/Domain/use%20cases/register_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'register_states.dart';

class RegisterViewModel extends Cubit<RegisterStates> {
  RegisterViewModel({required this.registerUseCase})
      : super(RegisterIntialState());
  var nameController = TextEditingController();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var confirmationPasswordController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  RegisterUseCase registerUseCase;
  AuthRepositryContract? repositoryContract;

  void register() async {
    if (formKey.currentState?.validate() == true) {
      emit(RegisterLoadingState(loadingMessage: "loading....."));
      var either = await registerUseCase.invoke(
          nameController.text,
          emailController.text,
          passwordController.text,
          confirmationPasswordController.text,
          phoneController.text);
      either.fold(
        (l) {
          emit(RegisterErrorState(errorMessage: l.errorMessage));
        },
        (r) {
          emit(RegisterSuccessState(response: r));
        },
      );
    }
  }
}
