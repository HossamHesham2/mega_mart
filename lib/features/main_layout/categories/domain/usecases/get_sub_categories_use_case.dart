import 'package:dartz/dartz.dart';
import 'package:ecommerce_c15_str/core/error/failures.dart';
import 'package:ecommerce_c15_str/features/main_layout/categories/data/models/sub_categories_response_model.dart';
import 'package:ecommerce_c15_str/features/main_layout/categories/domain/repository/categories_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetSubCategoriesUseCase {
  CategoriesRepository categoriesRepository;

  GetSubCategoriesUseCase(this.categoriesRepository);

  Future<Either<Failures, SubCategoriesResponseModel>> call(String categoryId) {
    return categoriesRepository.getSubCategories(categoryId);
  }
}
