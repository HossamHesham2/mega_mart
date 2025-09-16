import 'package:dartz/dartz.dart';
import 'package:ecommerce_c15_str/core/error/failures.dart';

import 'package:ecommerce_c15_str/features/auth/login/data/models/login_response_model.dart';
import 'package:ecommerce_c15_str/features/auth/login/data/models/login_request.dart';
import 'package:ecommerce_c15_str/features/auth/login/domain/repository/login_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase {
  LoginRepository repo;

  LoginUseCase(this.repo);

  Future<Either<Failures, LoginResponseModel>> call(
    LoginRequest request,
  ) {
    return repo.login(request);
  }
}
