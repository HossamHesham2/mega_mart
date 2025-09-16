import 'package:ecommerce_c15_str/core/di/di.dart';
import 'package:ecommerce_c15_str/core/network/commerce_client.dart';
import 'package:ecommerce_c15_str/features/cart/data/model/cart_request.dart';
import 'package:ecommerce_c15_str/features/cart/data/model/cart_response_model.dart';
import 'package:ecommerce_c15_str/features/products_screen/data/model/product_response_model.dart';
import 'package:injectable/injectable.dart';

abstract class ProductRemoteDs {
  Future<ProductResponseModel> getProduct();
  Future<CartResponseModel> addToCart(CartRequest request, String token);

}

@Injectable(as: ProductRemoteDs)
class ProductRemoteDsImpl extends ProductRemoteDs {
  @override
  Future<ProductResponseModel> getProduct() {
    return getIt<CommerceClient>().getProducts();
  }

  @override
  Future<CartResponseModel> addToCart(CartRequest request, String token) {
    return getIt<CommerceClient>().addToCart(request,token);
  }
}
