import 'package:dartz/dartz.dart';
import 'package:ecommerce_c15_str/core/error/failures.dart';
import 'package:ecommerce_c15_str/features/cart/data/model/cart_request.dart';
import 'package:ecommerce_c15_str/features/cart/data/model/get_cart_response_model.dart';
import 'package:ecommerce_c15_str/features/cart/domain/entity/cart_response_entity.dart';

abstract class CartRepository {
  Future<Either<Failures, CartResponseEntity>> addToCart(CartRequest request);
  Future<Either<Failures, GetCartResponseModel>> getCart();
}
