import '../../../Domain/Entities/login_responce_entity.dart';

/// message : "success"
/// user : {"name":"omar","email":"omarrmostafaiii@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3ZmJjNzg5NDE0ZjhiYzJiNDM2MTM4NSIsIm5hbWUiOiJvbWFyIiwicm9sZSI6InVzZXIiLCJpYXQiOjE3NDQ1NTM5MjMsImV4cCI6MTc1MjMyOTkyM30.IfyNvqpd7ptbyMuBR9zfimAaB6AU45-QvnFzlfu3Q9Q"



class LoginResponceDto {
  final String token;
  final String message;

  LoginResponceDto({
    required this.token,
    required this.message,
  });

  factory LoginResponceDto.fromJson(Map<String, dynamic> json) {
    return LoginResponceDto(
      token: json['token'] ?? '',
      message: json['message'] ?? '',
    );
  }

  LoginResponceEntity toEntity() {
    return LoginResponceEntity(
      token: token,
      message: message,
    );
  }
}