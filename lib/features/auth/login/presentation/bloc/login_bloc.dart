import 'package:bloc/bloc.dart';
import 'package:ecommerce_c15_str/core/error/failures.dart';
import 'package:ecommerce_c15_str/features/auth/login/data/models/login_response_model.dart';
import 'package:ecommerce_c15_str/features/auth/login/data/models/login_request.dart';
import 'package:ecommerce_c15_str/features/auth/login/domain/usecases/login_usecase.dart';
import 'package:injectable/injectable.dart';

part 'login_event.dart';

part 'login_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, LoginState> {
  LoginUseCase loginUseCase;

  AuthBloc(this.loginUseCase) : super(AuthInitState()) {
    on<LoginEvent>((event, emit) async {
      emit(state.copyWith(loginRequestState: RequestState.loading));

      var result = await loginUseCase.call(
        LoginRequest(email: event.email, password: event.password),
      );

      result.fold(
        (fail) {
          emit(
            state.copyWith(
              loginRequestState: RequestState.error,
              loginFailure: fail,
            ),
          );
        },
        (model) {
          emit(
            state.copyWith(
              loginRequestState: RequestState.success,
              authResponseModel: model,
            ),
          );
        },
      );
    });
  }
}
