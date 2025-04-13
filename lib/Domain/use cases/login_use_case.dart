import 'package:commerce_app_project/Data/repositry/auth%20repository%20implementation/repositry/auth_repositor_implementation.dart';
import 'package:commerce_app_project/Domain/Entities/failures.dart';
import 'package:commerce_app_project/Domain/repository/repositry/auth_repositry_contract.dart';
import 'package:dartz/dartz.dart';

import '../Entities/login_responce_entity.dart';
import '../Entities/register_responce_entity.dart';

class LoginUseCase {
  AuthRepositryContract repositoryContract;

  LoginUseCase({required this.repositoryContract});

//   register
  Future<Either<Failures,LoginResponceEntity>> invoke( String email,
      String password) {
     return repositoryContract.login(email, password);

  }
}
LoginUseCase injectLoginUseCase(){
  return  LoginUseCase(repositoryContract: injectAuthRepositoryContract());
}
