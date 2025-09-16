import 'package:ecommerce_c15_str/features/auth/login/data/models/login_response_model.dart';
import 'package:ecommerce_c15_str/features/auth/login/data/models/login_request.dart';

abstract class LoginRemoteDS {
  Future<LoginResponseModel> login(LoginRequest request);
}
