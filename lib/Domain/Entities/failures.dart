class Failures {
  String? errorMessage;

  Failures({required this.errorMessage});
}
class ServerErrors extends Failures{
  ServerErrors({required super.errorMessage});
}
class NetworkErrors extends Failures{
  NetworkErrors({required super.errorMessage});


}