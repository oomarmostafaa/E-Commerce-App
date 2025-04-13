import 'package:commerce_app_project/Data/model/responce/user_dto.dart';

import 'register_error_responce.dart';


/// message : "success"
/// user : {"name":"ahmeed Abtd Al-Muti","email":"ahmedfmuwttii40512@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3ZjYwZmEzMzVmNzZmYTQzZGNhMGY0NCIsIm5hbWUiOiJhaG1lZWQgQWJ0ZCBBbC1NdXRpIiwicm9sZSI6InVzZXIiLCJpYXQiOjE3NDQxNzkxMDgsImV4cCI6MTc1MTk1NTEwOH0.b4lPSCjvVEuoDU7kFrqlkHv4ScuJrQSUnlFzp7ZvxYw"

class RegisterResponceDto {
  RegisterResponceDto({this.message, this.user, this.token, this.error});

  RegisterResponceDto.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    error = json['errors'] != null
        ? RegisterErrorResponce.fromJson(json['errors'])
        : null;
    token = json['token'];
  }

  String? message;
  UserDto? user;
  String? token;
  RegisterErrorResponce? error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }
}
