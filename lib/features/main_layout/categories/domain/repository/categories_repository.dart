import 'package:dartz/dartz.dart';
import 'package:ecommerce_c15_str/core/error/failures.dart';
import 'package:ecommerce_c15_str/features/main_layout/categories/data/models/sub_categories_response_model.dart';

abstract class  CategoriesRepository {
  Future<Either<Failures,SubCategoriesResponseModel>> getSubCategories(String categoryId);
}