import 'package:commerce_app_project/Data/model/responce/register_responce_dto.dart';
import 'package:commerce_app_project/Domain/Entities/register_responce_entity.dart';

import '../../../Domain/Entities/login_responce_entity.dart';


abstract class LoginStates {}

class LoginIntialState extends LoginStates {}

class LoginLoadingState extends LoginStates {
  String? loadingMessage;

  LoginLoadingState({this.loadingMessage});
}

class LoginErrorState extends LoginStates {
  String? errorMessage;

  LoginErrorState({required this.errorMessage});
}

class LoginSuccessState extends LoginStates {
  final LoginResponceEntity response;

  LoginSuccessState({required this.response});
}

