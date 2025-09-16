import 'package:dartz/dartz.dart';
import 'package:ecommerce_c15_str/core/error/failures.dart';
import 'package:ecommerce_c15_str/features/cart/data/model/get_cart_response_model.dart';
import 'package:ecommerce_c15_str/features/cart/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCartUseCas {
  CartRepository cartRepository;

  GetCartUseCas(this.cartRepository);

  Future<Either<Failures, GetCartResponseModel>> call() {
    return cartRepository.getCart();
  }
}
