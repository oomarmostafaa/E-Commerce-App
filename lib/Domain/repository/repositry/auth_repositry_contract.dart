import 'package:commerce_app_project/Domain/Entities/failures.dart';
import 'package:commerce_app_project/Domain/Entities/register_responce_entity.dart';
import 'package:dartz/dartz.dart';

import '../../Entities/login_responce_entity.dart';

abstract class AuthRepositryContract {
  // من الApi manager
  Future<Either<Failures,RegisterResponceEntity>>register(String name, String email,
      String password, String repassword, String phone);
  Future<Either<Failures,LoginResponceEntity>>login( String email,
      String password);
}