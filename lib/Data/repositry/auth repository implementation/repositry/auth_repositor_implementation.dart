

import 'package:commerce_app_project/Domain/Entities/login_responce_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../Domain/Entities/failures.dart';
import '../../../../Domain/Entities/register_responce_entity.dart';
import '../../../../Domain/repository/Data source/auth_remote_data_source.dart';
import '../../../../Domain/repository/repositry/auth_repositry_contract.dart';
import '../Data source/auth_remote_data_source_implementation.dart';

  class AuthRepositoryImplementation implements AuthRepositryContract{
    AuthRemoteDataSource remoteDataSource;

    AuthRepositoryImplementation({required this.remoteDataSource});

    @override
    Future<Either<Failures,RegisterResponceEntity>> register(String name, String email, String password, String repassword, String phone) {
      return remoteDataSource.register(name, email, password, repassword, phone);
    }

  @override
  Future<Either<Failures, LoginResponceEntity>> login(String email, String password) {
    return remoteDataSource.login(email, password);
  }

  }
  AuthRepositryContract injectAuthRepositoryContract(){
    return AuthRepositoryImplementation(remoteDataSource:injectAuthRemoteDataSource());
  }