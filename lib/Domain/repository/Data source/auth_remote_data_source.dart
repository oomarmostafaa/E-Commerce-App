
import 'package:commerce_app_project/Data/model/responce/register_responce_dto.dart';
import 'package:dartz/dartz.dart';

import '../../Entities/failures.dart';
import '../../Entities/login_responce_entity.dart';
import '../../Entities/register_responce_entity.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failures,RegisterResponceEntity>>register(String name, String email,
      String password, String repassword, String phone);
  Future<Either<Failures,LoginResponceEntity>>login( String email,
      String password);
}