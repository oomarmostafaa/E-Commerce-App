// statusMsg : "fail"
// message : "Account Already Exists"

class RegisterErrorResponce {
  RegisterErrorResponce({
      this.statusMsg, 
      this.message,});

  RegisterErrorResponce.fromJson(dynamic json) {
    statusMsg = json['statusMsg'];
    message = json['message'];
  }
  String? statusMsg;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statusMsg'] = statusMsg;
    map['message'] = message;
    return map;
  }

}