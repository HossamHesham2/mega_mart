import 'package:dartz/dartz.dart';
import 'package:ecommerce_c15_str/core/error/failures.dart';
import 'package:ecommerce_c15_str/features/main_layout/home/data/data_source/home_remote_ds.dart';
import 'package:ecommerce_c15_str/features/main_layout/home/data/model/brands_response_model.dart';
import 'package:ecommerce_c15_str/features/main_layout/home/data/model/categories_response_model.dart';
import 'package:ecommerce_c15_str/features/main_layout/home/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: HomeRepository)
class HomeRepositoryImpl extends HomeRepository {
  HomeRemoteDs homeRemoteDs;

  HomeRepositoryImpl(this.homeRemoteDs);

  @override
  Future<Either<Failures, CategoriesResponseModel>> getAllCategories() async {
    try {
      final result = await homeRemoteDs.getAllCategories();
      return Right(result);
    } catch (e) {
      return Left(GeneralFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failures, BrandsResponseModel>> getAllBrands()async {
    try {
      final result = await homeRemoteDs.getAllBrands();
      return Right(result);
    } catch (e) {
      return Left(GeneralFailure(message: e.toString()));
    }
  }
}
