import 'package:dartz/dartz.dart';
import 'package:ecommerce_c15_str/core/error/failures.dart';
import 'package:ecommerce_c15_str/features/products_screen/data/model/product_response_model.dart';

abstract class ProductRepository {
  Future<Either<Failures, ProductResponseModel>> getProduct();
}
