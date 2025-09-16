import 'package:dartz/dartz.dart';
import 'package:ecommerce_c15_str/core/error/failures.dart';
import 'package:ecommerce_c15_str/features/cart/data/model/cart_request.dart';
import 'package:ecommerce_c15_str/features/cart/domain/entity/cart_response_entity.dart';
import 'package:ecommerce_c15_str/features/products_screen/domain/repository/product_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddToCartUseCas {
  ProductRepository productRepository;

  AddToCartUseCas(this.productRepository);

  Future<Either<Failures, CartResponseEntity>> call(CartRequest request) {
    return productRepository.addToCart(request);
  }
}
