import 'package:ecommerce_c15_str/core/di/di.dart';
import 'package:ecommerce_c15_str/core/network/commerce_client.dart';
import 'package:ecommerce_c15_str/features/cart/data/model/cart_request.dart';
import 'package:ecommerce_c15_str/features/cart/data/model/cart_response_model.dart';
import 'package:ecommerce_c15_str/features/cart/data/model/delete_cart_response_model.dart';
import 'package:ecommerce_c15_str/features/cart/data/model/get_cart_response_model.dart';
import 'package:injectable/injectable.dart';

abstract class CartRemoteDs {
  Future<CartResponseModel> addToCart(CartRequest request, String token);

  Future<GetCartResponseModel> getCart(String token);

  Future<DeleteCartResponseModel> deleteCart(String token);
}

@Injectable(as: CartRemoteDs)
class CartRemoteDsImpl extends CartRemoteDs {
  @override
  Future<CartResponseModel> addToCart(CartRequest request, String token) {
    return getIt<CommerceClient>().addToCart(request, token);
  }

  @override
  Future<GetCartResponseModel> getCart(String token) {
    return getIt<CommerceClient>().getCart(token);
  }

  @override
  Future<DeleteCartResponseModel> deleteCart(String token) {
    return getIt<CommerceClient>().deleteCart(token);
  }
}
