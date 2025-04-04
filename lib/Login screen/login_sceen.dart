import 'package:commerce_app_project/utilits/app_color.dart';
import 'package:commerce_app_project/utilits/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginSceen extends StatelessWidget {


  static const String routeName = "LoginScreen";

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  LoginSceen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height * 2,
          decoration: BoxDecoration(color: AppColors.primaryColor),
          child: SingleChildScrollView(
            child: Column(

              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 50,bottom: 25),
                  child: Image(image: AssetImage("assets/images/logo.png"),height: 120,),
                ),
                Padding(
                  padding: const EdgeInsets.only(right:200,bottom: 5),
                  child: Text("Welcome Back",style: TextStyle(fontSize: 20,color: AppColors.greenColor,fontWeight:FontWeight.bold ),),
                ),
                Padding(
                  padding: const EdgeInsets.only(right:150,bottom: 25),
                  child: Text("please sign in with your Email",style: TextStyle(fontSize: 13,color: AppColors.greenColor, ),),
                ),
                Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "E_mail Address",
                                style: TextStyle(color: AppColors.whiteColor),
                              )),
                        ),
                        CustomTextFormField(
                          label: "Enter your Email Address",
                          controller: emailController,
                          KeyoardType: TextInputType.emailAddress,
                          myValidator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return "please enter your E-mail Address";
                            }bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(text);
                            if (!emailValid) {
                              return "Please enter valid email";
                            }
                            return null;
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Password",
                                style: TextStyle(color: AppColors.whiteColor),
                              )),
                        ),
                        CustomTextFormField(
                          label: "Enter your Password",
                          controller: passwordController,
                          Secure: true,
                          myValidator: (text) {
                            if (text == null || text.trim().isEmpty) {
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
                          padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 8),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.greenColor),
                              onPressed: () {
                                login();
                              },
                              child: Text(
                                ("Login"),
                                style: TextStyle(
                                    color: AppColors.whiteColor, fontSize: 16),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 60,bottom: 40),
                          child: Text("Don’t have an account? Create Account",style: TextStyle(fontSize: 13,color: AppColors.greenColor, ),),
                        ),
                      ],
                    )),
              ],
            ),
          )),
    );
  }

  void login() async{
    if (formKey.currentState?.validate() == true) {
      try {
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }catch (e) {
        print(e.toString());
      }
    }
  }
}
