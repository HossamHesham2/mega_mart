import 'package:dartz/dartz.dart';
import 'package:ecommerce_c15_str/core/error/failures.dart';
import 'package:ecommerce_c15_str/features/main_layout/home/data/model/brands_response_model.dart';
import 'package:ecommerce_c15_str/features/main_layout/home/data/model/categories_response_model.dart';

abstract class HomeRepository {
  Future<Either<Failures, CategoriesResponseModel>> getAllCategories();
  Future<Either<Failures, BrandsResponseModel>> getAllBrands();
}
