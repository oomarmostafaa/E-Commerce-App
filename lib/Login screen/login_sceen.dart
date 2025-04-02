import 'package:commerce_app_project/utilits/app_color.dart';
import 'package:commerce_app_project/utilits/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  static const String routeName = "loginScreen";

  @override
  State<loginScreen> createState() => _RegisterState();
}

class _RegisterState extends State<loginScreen> {

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height * 2,
          decoration: BoxDecoration(color: AppColors.primaryColor),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.3,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                              alignment: Alignment.topLeft,
                              child: Text("Full Name",
                                  style:
                                      TextStyle(color: AppColors.whiteColor))),
                        ),
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
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Confirmation Password",
                                style: TextStyle(color: AppColors.whiteColor),
                              )),
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
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
                        const SizedBox(
                          height: 35,
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
        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text,
        );
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
