import 'package:dartz/dartz.dart';
import 'package:ecommerce_c15_str/core/error/failures.dart';
import 'package:ecommerce_c15_str/features/product_details/data/model/product_details_wrapper.dart';

abstract class ProductDetailsRepository {
  Future<Either<Failures, ProductDetailsWrapper>> getProductDetails(
    String id,
  );
}
