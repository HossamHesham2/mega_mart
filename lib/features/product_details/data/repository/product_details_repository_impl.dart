import 'package:dartz/dartz.dart';
import 'package:ecommerce_c15_str/core/error/failures.dart';
import 'package:ecommerce_c15_str/features/product_details/data/data_source/product_details_remote_ds.dart';
import 'package:ecommerce_c15_str/features/product_details/data/model/product_details_wrapper.dart';
import 'package:ecommerce_c15_str/features/product_details/domain/repository/product_details_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductDetailsRepository)
class ProductDetailsRepositoryImpl extends ProductDetailsRepository {
  ProductDetailsRemoteDs productDetailsRemoteDs;

  ProductDetailsRepositoryImpl(this.productDetailsRemoteDs);

  @override
  Future<Either<Failures, ProductDetailsWrapper>> getProductDetails(
    String id,
  ) async {
    try {
      final result = await productDetailsRemoteDs.getProductDetails(id);
      return Right(result);
    } catch (e) {
      return Left(GeneralFailure(message: e.toString()));
    }
  }
}
