import 'package:dartz/dartz.dart';
import 'package:ecommerce_c15_str/core/error/failures.dart';
import 'package:ecommerce_c15_str/features/main_layout/categories/data/data_source/categories_remote_ds.dart';
import 'package:ecommerce_c15_str/features/main_layout/categories/data/models/sub_categories_response_model.dart';
import 'package:ecommerce_c15_str/features/main_layout/categories/domain/repository/categories_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoriesRepository)
class CategoriesRepositoryImpl extends CategoriesRepository {
  CategoriesRemoteDs categoriesRemoteDs;

  CategoriesRepositoryImpl(this.categoriesRemoteDs);

  @override
  Future<Either<Failures, SubCategoriesResponseModel>> getSubCategories(
    String categoryId,
  ) async {
    try {
      var result = await categoriesRemoteDs.getSubCategories(categoryId);
      return Right(result);
    } catch (e) {
      return Left(GeneralFailure(message: e.toString()));
    }
  }
}
