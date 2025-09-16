import 'package:dartz/dartz.dart';
import 'package:ecommerce_c15_str/core/error/failures.dart';
import 'package:ecommerce_c15_str/features/auth/login/data/models/login_response_model.dart';
import 'package:ecommerce_c15_str/features/auth/login/data/models/login_request.dart';

abstract class LoginRepository {
  Future<Either<Failures,LoginResponseModel>> login(LoginRequest request);
}
