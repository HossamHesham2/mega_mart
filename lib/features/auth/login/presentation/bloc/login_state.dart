part of 'login_bloc.dart';

class LoginState {
  final RequestState? loginRequestState;
  final LoginResponseModel? authResponseModel;
  final Failures? loginFailure;

  LoginState({
    this.loginRequestState,
    this.authResponseModel,
    this.loginFailure,
  });

  LoginState copyWith({
    RequestState? loginRequestState,
    LoginResponseModel? authResponseModel,
    Failures? loginFailure,
  }) {
    return LoginState(
      loginRequestState: loginRequestState ?? this.loginRequestState,
      authResponseModel: authResponseModel ?? this.authResponseModel,
      loginFailure: loginFailure ?? this.loginFailure,
    );
  }
}

class AuthInitState extends LoginState {
  AuthInitState() : super(loginRequestState: RequestState.init);
}

enum RequestState { init, success, error, loading }
