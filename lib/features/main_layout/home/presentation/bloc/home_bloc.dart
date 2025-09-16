import 'package:bloc/bloc.dart';
import 'package:ecommerce_c15_str/core/error/failures.dart';
import 'package:ecommerce_c15_str/features/main_layout/home/data/model/brands_response_model.dart';
import 'package:ecommerce_c15_str/features/main_layout/home/data/model/categories_response_model.dart';
import 'package:ecommerce_c15_str/features/main_layout/home/domain/usecases/get_all_brands_use_case.dart';
import 'package:ecommerce_c15_str/features/main_layout/home/domain/usecases/get_all_categories_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'home_event.dart';

part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvents, HomeState> {
  GetCategoriesUseCase getAllCategoriesUseCase;
  GetAllBrandsUseCase getAllBrandsUseCase;

  HomeBloc(this.getAllCategoriesUseCase, this.getAllBrandsUseCase)
    : super(HomeState.initial()) {
    on<GetCategoriesEvent>((event, emit) async {
      emit(state.copyWith(categoriesRequestState: RequestState.loading));
      final result = await getAllCategoriesUseCase.call();

      result.fold(
        (l) => emit(
          state.copyWith(
            categoriesFailures: l,
            categoriesRequestState: RequestState.error,
          ),
        ),
        (r) => emit(
          state.copyWith(
            categoriesResponseModel: r,
            categoriesRequestState: RequestState.success,
          ),
        ),
      );
    });
    on<GetBrandsEvent>((event, emit) async {
      emit(state.copyWith(brandsRequestState: RequestState.loading));
      final result = await getAllBrandsUseCase();

      result.fold(
        (l) => emit(
          state.copyWith(
            brandsFailures: l,
            brandsRequestState: RequestState.error,
          ),
        ),
        (r) => emit(
          state.copyWith(
            brandsResponseModel: r,
            brandsRequestState: RequestState.success,
          ),
        ),
      );
    });
  }
}
