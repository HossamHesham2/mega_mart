import 'package:dartz/dartz.dart';
import 'package:ecommerce_c15_str/core/constant/constant_key.dart';
import 'package:ecommerce_c15_str/core/error/failures.dart';
import 'package:ecommerce_c15_str/features/cart/data/model/cart_request.dart';
import 'package:ecommerce_c15_str/features/cart/domain/entity/cart_response_entity.dart';
import 'package:ecommerce_c15_str/features/products_screen/data/data_source/product_remote_ds.dart';
import 'package:ecommerce_c15_str/features/products_screen/data/model/product_response_model.dart';
import 'package:ecommerce_c15_str/features/products_screen/domain/repository/product_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  @override
  Future<Either<Failures, CartResponseEntity>> addToCart(
    CartRequest request,
  ) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString(ConstantKey.tokenKey) ?? "";
      final result = await productRemoteDs.addToCart(request, token);
      return Right(result);
    } on Exception catch (e) {
      return Left(GeneralFailure(message: e.toString()));
    }
  }
}
