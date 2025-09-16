import 'package:json_annotation/json_annotation.dart';

part 'sign_up_request.g.dart';

@JsonSerializable()
class SignUpRequest {
  final String name;
  final String phone;
  final String email;
  final String password;
  final String rePassword;

  SignUpRequest({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
    required this.rePassword,
  });

  factory SignUpRequest.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpRequestToJson(this);
}
