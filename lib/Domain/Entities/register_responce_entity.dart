import 'package:commerce_app_project/Domain/Entities/user_entity.dart';


/// message : "success"
/// user : {"name":"ahmeed Abtd Al-Muti","email":"ahmedfmuwttii40512@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3ZjYwZmEzMzVmNzZmYTQzZGNhMGY0NCIsIm5hbWUiOiJhaG1lZWQgQWJ0ZCBBbC1NdXRpIiwicm9sZSI6InVzZXIiLCJpYXQiOjE3NDQxNzkxMDgsImV4cCI6MTc1MTk1NTEwOH0.b4lPSCjvVEuoDU7kFrqlkHv4ScuJrQSUnlFzp7ZvxYw"

class RegisterResponceEntity {
  RegisterResponceEntity({this.message, this.user, this.token,});



  String? message;
  UserEntity? user;
  String? token;
}
