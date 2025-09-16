import 'package:dartz/dartz.dart';
import 'package:ecommerce_c15_str/core/constant/constant_key.dart';
import 'package:ecommerce_c15_str/core/error/failures.dart';
import 'package:ecommerce_c15_str/features/auth/sign_up/data/datasources/sign_up_remote_ds.dart';
import 'package:ecommerce_c15_str/features/auth/sign_up/data/models/sign_up_request.dart';
import 'package:ecommerce_c15_str/features/auth/sign_up/data/models/sign_up_response_model.dart';
import 'package:ecommerce_c15_str/features/auth/sign_up/domain/repository/sign_up_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as: SignUpRepository)
class SignUpRepositoryImpl extends SignUpRepository {
  SignUpRemoteDs signUpRemoteDs;

  SignUpRepositoryImpl(this.signUpRemoteDs);

  @override
  Future<Either<Failures, SignUpResponseModel>> signUp(SignUpRequest request) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var result = await signUpRemoteDs.signUp(request);

      if (result.message != "success") {

        return Left(GeneralFailure(message: result.message));
      }
      await prefs.setString(ConstantKey.tokenKey, result.token);
      return Right(result);
    } catch (e) {
      return left(GeneralFailure(message: e.toString()));
    }
  }
}
