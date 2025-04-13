// view جزء ال
import  'package:commerce_app_project/Domain/use%20cases/register_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../utilits/app_color.dart';
import '../utilits/custom_text_form_field.dart';
import 'View model or Cuit/register_states.dart';
import 'View model or Cuit/register_view_model.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  static const String routeName = "Register";

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  RegisterViewModel viewModel = RegisterViewModel(registerUseCase: injectRegisterUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterViewModel, RegisterStates>(
        bloc: viewModel,
        listener: (context, state) {
          if (state is RegisterLoadingState) {
            DialogUtils.showLoading(context, state.loadingMessage!);
          } else if (state is RegisterErrorState) {
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(
                context,
                state.errorMessage!,
                posActionName: 'Ok'
            );
          } else if (state is RegisterSuccessState) {
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(
              context,
              state.response.user?.name ?? "",
              posActionName: 'Ok',
            );
          }
        },
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(color: AppColors.primaryColor),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 50, bottom: 6),
                    child: Image(
                      image: AssetImage("assets/images/logo.png"),
                      height: 120,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 0, bottom: 30),
                    child: Text(
                      "Welcome",
                      style: TextStyle(
                          fontSize: 20,
                          color: AppColors.greenColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Column(
                    children: [
                      Form(
                          key: viewModel.formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 20),
                                child: Container(
                                    alignment: Alignment.topLeft,
                                    child: Text("Full Name",
                                        style: TextStyle(
                                            color: AppColors.whiteColor))),
                              ),
                              CustomTextFormField(
                                label: "Enter your Full Name",
                                controller: viewModel.nameController,
                                myValidator: (text) {
                                  if (text == null || text
                                      .trim()
                                      .isEmpty) {
                                    return "please enter your name";
                                  }
                                  return null;
                                },
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 20),
                                child: Container(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "E_mail Address",
                                      style: TextStyle(
                                          color: AppColors.whiteColor),
                                    )),
                              ),
                              CustomTextFormField(
                                label: "Enter your Email Address",
                                controller: viewModel.emailController,
                                KeyoardType: TextInputType.emailAddress,
                                myValidator: (text) {
                                  if (text == null || text
                                      .trim()
                                      .isEmpty) {
                                    return "please enter your E-mail Address";
                                  }
                                  bool emailValid = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(text);
                                  if (!emailValid) {
                                    return "Please enter valid email";
                                  }
                                  return null;
                                },
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 20),
                                child: Container(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Password",
                                      style: TextStyle(
                                          color: AppColors.whiteColor),
                                    )),
                              ),
                              CustomTextFormField(
                                label: "Enter your Password",
                                controller: viewModel.passwordController,
                                Secure: true,
                                myValidator: (text) {
                                  if (text == null || text
                                      .trim()
                                      .isEmpty) {
                                    return "please enter your password";
                                  }
                                  if (text.length < 6) {
                                    return "password should be at least 6 characters";
                                  }
                                  return null;
                                },
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 20),
                                child: Container(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Confirmation Password",
                                      style: TextStyle(
                                          color: AppColors.whiteColor),
                                    )),
                              ),
                              CustomTextFormField(
                                label: "Enter your Confirmation Password",
                                controller:
                                viewModel.confirmationPasswordController,
                                Secure: true,
                                myValidator: (text) {
                                  if (text == null || text
                                      .trim()
                                      .isEmpty) {
                                    return "please enter confirmation password";
                                  }
                                  if (text !=
                                      viewModel.passwordController.text) {
                                    return "password doesn't match";
                                  }
                                  return null;
                                },
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 20),
                                child: Container(
                                    alignment: Alignment.topLeft,
                                    child: Text("phone",
                                        style: TextStyle(
                                            color: AppColors.whiteColor))),
                              ),
                              CustomTextFormField(
                                label: "Enter your phone",
                                controller: viewModel.phoneController,
                                myValidator: (text) {
                                  if (text == null || text
                                      .trim()
                                      .isEmpty) {
                                    return "please enter your phone";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 35,
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 30),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.greenColor),
                                    onPressed: () {
                                      viewModel.register();
                                    },
                                    child: Text(
                                      ("Register"),
                                      style: TextStyle(
                                          color: AppColors.whiteColor,
                                          fontSize: 16),
                                    )),
                              ),
                              const SizedBox(
                                height: 35,
                              ),
                            ],
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class DialogUtils {
  static void showLoading(BuildContext context, String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) =>
          AlertDialog(
            content: Row(
              children: [
                const CircularProgressIndicator(),
                const SizedBox(width: 16),
                Expanded(child: Text(message)),
              ],
            ),
          ),
    );
  }

  static void hideLoading(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }

  static void showMessage(BuildContext context,
      String message, {
        String posActionName = 'Ok',
        VoidCallback? posAction,
      }) {
    showDialog(
      context: context,
      builder: (_) =>
          AlertDialog(
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  if (posAction != null) posAction();
                },
                child: Text(posActionName),
              )
            ],
          ),
    );
  }
}



