import 'package:ecommerce_c15_str/core/di/di.dart';
import 'package:ecommerce_c15_str/core/network/commerce_client.dart';
import 'package:ecommerce_c15_str/features/auth/sign_up/data/datasources/sign_up_remote_ds.dart';
import 'package:ecommerce_c15_str/features/auth/sign_up/data/models/sign_up_request.dart';
import 'package:ecommerce_c15_str/features/auth/sign_up/data/models/sign_up_response_model.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: SignUpRemoteDs)
class SignUpRemoteDsImpl extends SignUpRemoteDs {
  @override
  Future<SignUpResponseModel> signUp(SignUpRequest request) {
    return getIt<CommerceClient>().signUp(request);
  }
}
