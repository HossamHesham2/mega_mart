import 'package:dartz/dartz.dart';
import 'package:ecommerce_c15_str/core/constant/constant_key.dart';
import 'package:ecommerce_c15_str/core/error/failures.dart';
import 'package:ecommerce_c15_str/features/auth/login/data/datasources/login_remote_ds.dart';
import 'package:ecommerce_c15_str/features/auth/login/data/models/login_response_model.dart';
import 'package:ecommerce_c15_str/features/auth/login/data/models/login_request.dart';
import 'package:ecommerce_c15_str/features/auth/login/domain/repository/login_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as: LoginRepository)
class LoginRepositoryImpl implements LoginRepository {
  LoginRemoteDS loginRemoteDS;

  LoginRepositoryImpl(this.loginRemoteDS);

  @override
  Future<Either<Failures, LoginResponseModel>> login(
    LoginRequest request,
  ) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var result = await loginRemoteDS.login(request);
      if (result.message != "success") {
        return Left(WrongPasswordFailure(message: result.message));
      }
      await prefs.setString(ConstantKey.tokenKey, result.token);
      return Right(result);
    } catch (e) {
      return Left(GeneralFailure(message: e.toString()));
    }
  }
}
