import 'package:ecommerce_c15_str/features/auth/sign_up/data/models/sign_up_request.dart';
import 'package:ecommerce_c15_str/features/auth/sign_up/data/models/sign_up_response_model.dart';

abstract class SignUpRemoteDs {
  Future<SignUpResponseModel> signUp(SignUpRequest request);
}
