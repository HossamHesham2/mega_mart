import 'package:dartz/dartz.dart';
import 'package:ecommerce_c15_str/core/error/failures.dart';
import 'package:ecommerce_c15_str/features/products_screen/data/model/product_response_model.dart';
import 'package:ecommerce_c15_str/features/products_screen/domain/repository/product_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProductUseCase {
  ProductRepository productRepository;

  GetProductUseCase(this.productRepository);

  Future<Either<Failures, ProductResponseModel>> call() {
    return productRepository.getProduct();
  }
}
