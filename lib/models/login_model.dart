class LoginUsernameResponse {
  LoginUsernameResponse({
    required this.success,
    required this.statusCode,
    required this.code,
    required this.message,
    required this.data,
  });
  late final bool success;
  late final int statusCode;
  late final String code;
  late final String message;
  late final Data data;

  LoginUsernameResponse.fromJson(Map<String, dynamic> json){
    success = json['success'];
    statusCode = json['statusCode'];
    code = json['code'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['statusCode'] = statusCode;
    _data['code'] = code;
    _data['message'] = message;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.token,
    required this.id,
    required this.email,
    required this.nicename,
    required this.firstName,
    required this.lastName,
    required this.displayName,
  });
  late final String token;
  late final int id;
  late final String email;
  late final String nicename;
  late final String firstName;
  late final String lastName;
  late final String displayName;

  Data.fromJson(Map<String, dynamic> json){
    token = json['token'];
    id = json['id'];
    email = json['email'];
    nicename = json['nicename'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    displayName = json['displayName'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['token'] = token;
    _data['id'] = id;
    _data['email'] = email;
    _data['nicename'] = nicename;
    _data['firstName'] = firstName;
    _data['lastName'] = lastName;
    _data['displayName'] = displayName;
    return _data;
  }
}