import 'package:ecommerce_c15_str/core/network/commerce_client.dart';
import 'package:ecommerce_c15_str/core/di/di.dart';
import 'package:ecommerce_c15_str/features/auth/login/data/datasources/login_remote_ds.dart';
import 'package:ecommerce_c15_str/features/auth/login/data/models/login_response_model.dart';
import 'package:ecommerce_c15_str/features/auth/login/data/models/login_request.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LoginRemoteDS)
class LoginRemoteDSImpl implements LoginRemoteDS {
  @override
  Future<LoginResponseModel> login(LoginRequest request) {
    return getIt<CommerceClient>().login(request);
  }
}
