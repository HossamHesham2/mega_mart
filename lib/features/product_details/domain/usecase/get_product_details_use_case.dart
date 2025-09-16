import 'package:dartz/dartz.dart';
import 'package:ecommerce_c15_str/core/error/failures.dart';
import 'package:ecommerce_c15_str/features/product_details/data/model/product_details_wrapper.dart';
import 'package:ecommerce_c15_str/features/product_details/domain/repository/product_details_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProductDetailsUseCase {
  ProductDetailsRepository productDetailsRepository;

  GetProductDetailsUseCase(this.productDetailsRepository);

  Future<Either<Failures, ProductDetailsWrapper>> call(String id) async {
    return await productDetailsRepository.getProductDetails(id);
  }
}
