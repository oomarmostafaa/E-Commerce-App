import 'package:commerce_app_project/Data/model/responce/register_responce_dto.dart';
import 'package:commerce_app_project/Domain/Entities/register_responce_entity.dart';


abstract class RegisterStates {}

class RegisterIntialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {
  String? loadingMessage;

  RegisterLoadingState({this.loadingMessage});
}

class RegisterErrorState extends RegisterStates {
  String? errorMessage;

  RegisterErrorState({required this.errorMessage});
}

class RegisterSuccessState extends RegisterStates {
  final RegisterResponceEntity response;

  RegisterSuccessState({required this.response});
}

