import 'package:commerce_app_project/Data/repositry/auth%20repository%20implementation/repositry/auth_repositor_implementation.dart';
import 'package:commerce_app_project/Domain/Entities/failures.dart';
import 'package:commerce_app_project/Domain/repository/repositry/auth_repositry_contract.dart';
import 'package:dartz/dartz.dart';

import '../Entities/register_responce_entity.dart';

class RegisterUseCase {
  AuthRepositryContract repositoryContract;

  RegisterUseCase({required this.repositoryContract});

//   register
  Future<Either<Failures,RegisterResponceEntity>> invoke(String name, String email,
      String password, String repassword, String phone) {
     return repositoryContract.register(name, email, password, repassword, phone);

  }
}
RegisterUseCase injectRegisterUseCase(){
  return  RegisterUseCase(repositoryContract: injectAuthRepositoryContract());
}
