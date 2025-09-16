import 'package:ecommerce_c15_str/core/di/di.dart';
import 'package:ecommerce_c15_str/core/network/commerce_client.dart';
import 'package:ecommerce_c15_str/features/product_details/data/model/product_details_wrapper.dart';
import 'package:injectable/injectable.dart';

abstract class ProductDetailsRemoteDs {
  Future<ProductDetailsWrapper> getProductDetails(String id);
}
@Injectable(as: ProductDetailsRemoteDs)
class ProductDetailsRemoteDsImpl extends ProductDetailsRemoteDs {
  

  @override
  Future<ProductDetailsWrapper> getProductDetails(String id) {
    return getIt<CommerceClient>().getProductsDetails(id);
  }
}
