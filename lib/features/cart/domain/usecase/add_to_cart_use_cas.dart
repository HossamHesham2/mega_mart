import 'package:dartz/dartz.dart';
import 'package:ecommerce_c15_str/core/error/failures.dart';
import 'package:ecommerce_c15_str/features/cart/data/model/cart_request.dart';
import 'package:ecommerce_c15_str/features/cart/domain/entity/cart_response_entity.dart';
import 'package:ecommerce_c15_str/features/cart/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddToCartUseCas {
  CartRepository cartRepository;

  AddToCartUseCas(this.cartRepository);

  Future<Either<Failures, CartResponseEntity>> call(CartRequest request ,) {
    return cartRepository.addToCart(request );
  }
}
