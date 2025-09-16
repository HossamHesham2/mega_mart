import 'package:bloc/bloc.dart';
import 'package:ecommerce_c15_str/core/error/failures.dart';
import 'package:ecommerce_c15_str/features/auth/sign_up/data/models/sign_up_request.dart';
import 'package:ecommerce_c15_str/features/auth/sign_up/data/models/sign_up_response_model.dart';
import 'package:ecommerce_c15_str/features/auth/sign_up/domain/usecases/sign_up_use_case.dart';
import 'package:injectable/injectable.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

@injectable
class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpUseCase signUpUseCase;

  SignUpBloc(this.signUpUseCase) : super(SignUpInitState()) {
    on<SignUpRequestEvent>((event, emit) async {
      emit(state.copyWith(signUpRequestState: RequestState.loading));

      var result = await signUpUseCase.call(
        SignUpRequest(
          name: event.name,
          phone: event.phone,
          email: event.email,
          password: event.password,
          rePassword: event.rePassword,
        ),
      );
      result.fold(
        (l) => emit(
          state.copyWith(
            signUpRequestState: RequestState.error,
            signUpFailure: l,
          ),
        ),
        (r) => emit(
          state.copyWith(
            signUpRequestState: RequestState.success,
            signUpResponseModel: r,
          ),
        ),
      );
    });
  }
}
