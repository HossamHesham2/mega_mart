import 'package:dartz/dartz.dart';
import 'package:ecommerce_c15_str/core/constant/constant_key.dart';
import 'package:ecommerce_c15_str/core/error/failures.dart';
import 'package:ecommerce_c15_str/features/cart/data/data_source/cart_remote_ds.dart';
import 'package:ecommerce_c15_str/features/cart/data/model/cart_request.dart';
import 'package:ecommerce_c15_str/features/cart/data/model/cart_response_model.dart';
import 'package:ecommerce_c15_str/features/cart/data/model/get_cart_response_model.dart';
import 'package:ecommerce_c15_str/features/cart/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as: CartRepository)
class CartRepositoryImpl extends CartRepository {
  CartRemoteDs cartRemoteDs;

  CartRepositoryImpl(this.cartRemoteDs);

  @override
  Future<Either<Failures, CartResponseModel>> addToCart(
    CartRequest request,
  ) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString(ConstantKey.tokenKey) ?? "";
      final result = await cartRemoteDs.addToCart(request, token);
      return Right(result);
    } on Exception catch (e) {
      return Left(GeneralFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failures, GetCartResponseModel>> getCart() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString(ConstantKey.tokenKey) ?? "";
      final result = await cartRemoteDs.getCart(token);
      return Right(result);
    } on Exception catch (e) {
      return Left(GeneralFailure(message: e.toString()));
    }
  }
}
