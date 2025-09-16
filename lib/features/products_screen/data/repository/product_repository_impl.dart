import 'package:dartz/dartz.dart';
import 'package:ecommerce_c15_str/core/error/failures.dart';
import 'package:ecommerce_c15_str/features/products_screen/data/data_source/product_remote_ds.dart';
import 'package:ecommerce_c15_str/features/products_screen/data/model/product_response_model.dart';
import 'package:ecommerce_c15_str/features/products_screen/domain/repository/product_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductRepository)
class ProductRepositoryImpl extends ProductRepository {
  ProductRemoteDs productRemoteDs;

  ProductRepositoryImpl(this.productRemoteDs);

  @override
  Future<Either<Failures, ProductResponseModel>> getProduct() async {
    try {
      var result = await productRemoteDs.getProduct();
      return Right(result);
    } catch (e) {
      return Left(GeneralFailure(message: e.toString()));
    }
  }
}
