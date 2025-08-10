import 'package:json_annotation/json_annotation.dart';
part 'signup_request_body.g.dart';

@JsonSerializable()
class SignupRequestBody {
  final String name;
  final String email;
  final String password;
  final String phone;
  @JsonKey(name: 'password_confirmation')
  final String passwordConfirmation;
  int gender;

  SignupRequestBody({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.passwordConfirmation,
    required this.gender,
  });

  Map<String, dynamic> toJson() => _$SignupRequestBodyToJson(this);
}
