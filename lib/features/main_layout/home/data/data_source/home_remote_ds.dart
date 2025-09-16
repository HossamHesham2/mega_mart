import 'package:ecommerce_c15_str/core/di/di.dart';
import 'package:ecommerce_c15_str/core/network/commerce_client.dart';
import 'package:ecommerce_c15_str/features/main_layout/home/data/model/brands_response_model.dart';
import 'package:ecommerce_c15_str/features/main_layout/home/data/model/categories_response_model.dart';
import 'package:injectable/injectable.dart';

abstract class HomeRemoteDs {
  Future<CategoriesResponseModel> getAllCategories();

  Future<BrandsResponseModel> getAllBrands();
}

@Injectable(as: HomeRemoteDs)
class HomeRemoteDsImpl extends HomeRemoteDs {
  @override
  Future<CategoriesResponseModel> getAllCategories() {
    return getIt<CommerceClient>().getAllCategories();
  }

  @override
  Future<BrandsResponseModel> getAllBrands() {
    return getIt<CommerceClient>().getAllBrands();
  }
}
