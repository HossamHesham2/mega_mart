part of 'sign_up_bloc.dart';

abstract class SignUpEvent {}

class SignUpRequestEvent extends SignUpEvent {
  final String name;
  final String phone;
  final String email;
  final String password;
  final String rePassword;

  SignUpRequestEvent(
    this.name,
    this.phone,
    this.email,
    this.password,
    this.rePassword,
  );
}
