import 'package:dartz/dartz.dart';
import 'package:ecommerce_c15_str/core/error/failures.dart';
import 'package:ecommerce_c15_str/features/main_layout/home/data/model/brands_response_model.dart';
import 'package:ecommerce_c15_str/features/main_layout/home/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetAllBrandsUseCase {
  final HomeRepository homeRepository;

  GetAllBrandsUseCase(this.homeRepository);

  Future<Either<Failures, BrandsResponseModel>> call() {
    return homeRepository.getAllBrands();
  }
}
