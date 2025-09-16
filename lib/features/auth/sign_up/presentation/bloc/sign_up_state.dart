part of 'sign_up_bloc.dart';

class SignUpState {
  final RequestState? signUpRequestState;
  final SignUpResponseModel? signUpResponseModel;
  final Failures? signUpFailure;

  SignUpState({
    this.signUpRequestState,
    this.signUpResponseModel,
    this.signUpFailure,
  });

  SignUpState copyWith({
    RequestState? signUpRequestState,
    SignUpResponseModel? signUpResponseModel,
    Failures? signUpFailure,
  }) {
    return SignUpState(
      signUpRequestState : signUpRequestState ?? this.signUpRequestState,
      signUpResponseModel : signUpResponseModel ?? this.signUpResponseModel,
      signUpFailure : signUpFailure ?? this.signUpFailure,
    );
  }
}
class SignUpInitState extends SignUpState {
  SignUpInitState() : super(signUpRequestState: RequestState.init);
}
enum RequestState { init, success, error, loading }
