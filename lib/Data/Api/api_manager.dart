import 'dart:convert';
import 'package:commerce_app_project/Data/Api/api_constance.dart';
import 'package:commerce_app_project/Data/model/responce/Login_responce_dto.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import '../../Domain/Entities/failures.dart';
import '../../Domain/Entities/login_responce_entity.dart';
import '../../Domain/Entities/register_responce_entity.dart';
import '../model/request/Login_request.dart';
import '../model/request/Register_request.dart';

class ApiManager {
  ApiManager._();

  static ApiManager? _instance;

  static ApiManager getInstance() {
    _instance ??= ApiManager._();
    return _instance!;
  }

  // دي الدالة اللي بترسل بيانات المستخدم للسيرفر.
  Future<Either<Failures, RegisterResponceEntity>> register(String name,
      String email, String password, String repassword, String phone) async {
    final List<ConnectivityResult> connectivityResult =
    await (Connectivity().checkConnectivity());

    // This condition is for demo purposes only to explain every connection type.
// Use conditions which work for your requirements.
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      Uri url = Uri.https(ApiConstance.baseUrl, ApiConstance.registerApi);
      //  تجهيز البيانات اللي هنبعتها
      var requestBody = RegisterRequest(
        email: email,
        name: name,
        password: password,
        phone: phone,
        rePassword: repassword,
      );
      var response = await http.post(
        url,
        body: requestBody.toJson(),
      );
      var responceBody = response.body;
      var json = jsonDecode(responceBody);
      var registerResponce = RegisterResponceDto.fromJson(json);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(registerResponce.toEntity());
      } else {
        return Left(Failures(errorMessage: registerResponce.message));
      }
    }
    return Left(Failures(errorMessage: "Unknown error occurred"));
  }

  Future<Either<Failures, LoginResponceEntity>> login(String email,
      String password,) async {
    final List<ConnectivityResult> connectivityResult =
    await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      Uri url = Uri.https(ApiConstance.baseUrl, ApiConstance.loginApi);

      var requestBody = LoginRequest(
        email: email,
        password: password,
      );

      var response = await http.post(
        url,
        body: requestBody.toJson(),
      );

      var responceBody = response.body;
      var json = jsonDecode(responceBody);
      var loginResponce = LoginResponceDto.fromJson(json);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(loginResponce.toEntity()); // 👈 التحويل هنا
      } else {
        return Left(Failures(errorMessage: loginResponce.message));
      }
    }

    return Left(Failures(errorMessage: "Unknown error occurred"));
  }
}
  class RegisterResponceDto {
  final String message;

  RegisterResponceDto({required this.message});

  // 🔧 دالة fromJson اللي بتحل المشكلة
  factory RegisterResponceDto.fromJson(Map<String, dynamic> json) {
    return RegisterResponceDto(
      message: json['message'] ?? '',
    );
  }

  RegisterResponceEntity toEntity() {
    return RegisterResponceEntity(message: message);
  }
}

