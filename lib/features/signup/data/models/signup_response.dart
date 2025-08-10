import 'package:json_annotation/json_annotation.dart';
part 'signup_response.g.dart';

@JsonSerializable()
class SignupResponse {
  final String message;
  @JsonKey(name:'data')
  final UserData userData;
  final bool status;
  final int code;

  SignupResponse( {
    required this.message,
    required this.userData,
    required this.status,
    required this.code,
  });

  factory SignupResponse.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignupResponseToJson(this);
}

@JsonSerializable()
class UserData {
  @JsonKey(name: 'username')
  final String userName;
  final String token;

  UserData({
    required this.userName,
    required this.token,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

}