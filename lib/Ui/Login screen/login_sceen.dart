// view جزء ال

import 'package:commerce_app_project/Domain/use%20cases/login_use_case.dart';
import 'package:commerce_app_project/Ui/Login%20screen/View%20model%20or%20Cuit/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Register/register.dart';
import '../utilits/app_color.dart';
import '../utilits/custom_text_form_field.dart';
import 'View model or Cuit/login_states.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "LoginScreen";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginViewModel viewModel = LoginViewModel(loginUseCase: injectLoginUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginViewModel, LoginStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is LoginLoadingState) {
          DialogUtils.showLoading(context, state.loadingMessage!);
        } else if (state is LoginErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context, state.errorMessage!,
              posActionName: 'Ok');
        } else if (state is LoginSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context,
            state.response.user?.name ?? "",
            posActionName: 'Ok',
          );
        }
      }, child: Scaffold(
      body: Container(
          height: MediaQuery
              .of(context)
              .size
              .height * 2,
          decoration: BoxDecoration(color: AppColors.primaryColor),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 50, bottom: 25),
                  child: Image(
                    image: AssetImage("assets/images/logo.png"),
                    height: 120,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 200, bottom: 5),
                  child: Text(
                    "Welcome Back",
                    style: TextStyle(
                        fontSize: 20,
                        color: AppColors.greenColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 150, bottom: 25),
                  child: Text(
                    "please sign in with your Email",
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.greenColor,
                    ),
                  ),
                ),
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
                        const SizedBox(
                          height: 35,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 8),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.greenColor),
                              onPressed: () {
                                viewModel.Login();
                              },
                              child: Text(
                                ("Login"),
                                style: TextStyle(
                                    color: AppColors.whiteColor,
                                    fontSize: 16),
                              )),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 60, bottom: 40),
                              child: Text(
                                "Don’t have an account?",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: AppColors.greenColor,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, Register.routeName);
                              },
                              child: Padding(
                                padding:
                                const EdgeInsets.only(bottom: 40),
                                child: Text(
                                  "Create Account",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: AppColors.greenColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    )),
              ],
            ),
          )),
    ),);
  }
}
