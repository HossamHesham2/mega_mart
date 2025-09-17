import 'package:dartz/dartz.dart';
import 'package:ecommerce_c15_str/core/error/failures.dart';
import 'package:ecommerce_c15_str/features/cart/data/model/delete_cart_response_model.dart';
import 'package:ecommerce_c15_str/features/cart/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteCartUseCase {
  CartRepository cartRepository;

  DeleteCartUseCase(this.cartRepository);

  Future<Either<Failures, DeleteCartResponseModel>> call() {
    return cartRepository.deleteCart();
  }
}
