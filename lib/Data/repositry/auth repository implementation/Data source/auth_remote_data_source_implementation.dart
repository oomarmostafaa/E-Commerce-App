import 'package:commerce_app_project/Data/Api/api_manager.dart';
import 'package:commerce_app_project/Domain/repository/Data%20source/auth_remote_data_source.dart';
import 'package:dartz/dartz.dart';

import '../../../../Domain/Entities/failures.dart';
import '../../../../Domain/Entities/login_responce_entity.dart';
import '../../../../Domain/Entities/register_responce_entity.dart';

class AuthRemoteDataSourceImplementation implements AuthRemoteDataSource {
  final ApiManager apiManager;

  AuthRemoteDataSourceImplementation({required this.apiManager});

  @override
  Future<Either<Failures, RegisterResponceEntity>> register(String name,
      String email,
      String password,
      String repassword,
      String phone,) async {
    var either = await apiManager.register(
        name, email, password, repassword, phone);
    return either.fold((l) {
      return Left(Failures(errorMessage: l.errorMessage));
    }
        , (r) {
          return Right(r);
        });
  }

  @override
  Future<Either<Failures, LoginResponceEntity>> login(String email,
      String password) async {
    var either = await apiManager.login(email, password);
    return either.fold((l) {
      return Left(Failures(errorMessage: l.errorMessage));
    }, (r) {
      return Right(r);
    },);
  }
}


AuthRemoteDataSource injectAuthRemoteDataSource() {
  return AuthRemoteDataSourceImplementation(
      apiManager: ApiManager.getInstance());
}
