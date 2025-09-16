import 'package:ecommerce_c15_str/core/di/di.dart';
import 'package:ecommerce_c15_str/core/network/commerce_client.dart';
import 'package:ecommerce_c15_str/features/main_layout/categories/data/models/sub_categories_response_model.dart';
import 'package:injectable/injectable.dart';

abstract class CategoriesRemoteDs {
  Future<SubCategoriesResponseModel> getSubCategories(String categoryId);
}
@Injectable(as: CategoriesRemoteDs)
class CategoriesRemoteDsImpl extends CategoriesRemoteDs {
  @override
  Future<SubCategoriesResponseModel> getSubCategories(String categoryId) {
    return getIt<CommerceClient>().getAllSubCategories(categoryId);
  }
}
