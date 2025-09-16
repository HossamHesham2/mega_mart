import 'package:dartz/dartz.dart';
import 'package:ecommerce_c15_str/core/error/failures.dart';
import 'package:ecommerce_c15_str/features/auth/sign_up/data/models/sign_up_request.dart';
import 'package:ecommerce_c15_str/features/auth/sign_up/data/models/sign_up_response_model.dart';
import 'package:ecommerce_c15_str/features/auth/sign_up/domain/repository/sign_up_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignUpUseCase {
  SignUpRepository signUpRepository;

  SignUpUseCase(this.signUpRepository);

  Future<Either<Failures, SignUpResponseModel>> call(SignUpRequest request) {
    return signUpRepository.signUp(request);
  }
}
