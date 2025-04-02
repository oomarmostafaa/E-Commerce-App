import 'package:commerce_app_project/utilits/app_color.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  String label;
  TextInputType KeyoardType;
  bool Secure;
  TextEditingController controller;
  String? Function(String?) myValidator;


  CustomTextFormField(
      {required this.label,
      this.KeyoardType = TextInputType.text,
      this.Secure = false,
      required this.controller,
      required this.myValidator});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextFormField(
        decoration: InputDecoration(
            fillColor: AppColors.whiteColor,
            filled: true,
            label: Text(
              label,
              style: TextStyle(fontSize: 12, color: AppColors.hintTextColor),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide:
                    BorderSide(color: AppColors.blackColor, width: 0.5))),
        keyboardType: KeyoardType,
        obscureText: Secure,
        controller: controller,
        validator:myValidator ,
      ),
    );
  }
}
