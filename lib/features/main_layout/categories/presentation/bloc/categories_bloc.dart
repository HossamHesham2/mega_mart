import 'package:bloc/bloc.dart';
import 'package:ecommerce_c15_str/core/error/failures.dart';
import 'package:ecommerce_c15_str/features/main_layout/categories/data/models/sub_categories_response_model.dart';
import 'package:ecommerce_c15_str/features/main_layout/categories/domain/usecases/get_sub_categories_use_case.dart';
import 'package:ecommerce_c15_str/features/main_layout/home/data/model/categories_response_model.dart';
import 'package:ecommerce_c15_str/features/main_layout/home/domain/usecases/get_all_categories_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'categories_event.dart';

part 'categories_state.dart';

@injectable
class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  GetCategoriesUseCase getCategoriesUseCase;
  GetSubCategoriesUseCase getSubCategoriesUseCase;

  CategoriesBloc(this.getCategoriesUseCase, this.getSubCategoriesUseCase)
    : super(CategoriesState.initState()) {
    on<CategoriesEvent>((event, emit) async {
      switch (event) {
        case GetCategoriesEvent():
          {
            emit(state.copyWith(categoriesRequestState: RequestState.loading));

            var result = await getCategoriesUseCase.call();

            result.fold(
              (l) => emit(
                state.copyWith(
                  categoriesRequestState: RequestState.error,
                  categoriesFailure: l,
                ),
              ),
              (r) {
                add(GetSubCategoriesEvent(categoryId: r.data.first.id));
                emit(
                  state.copyWith(
                    categoriesRequestState: RequestState.success,
                    categoriesResponseModel: r,
                  ),
                );
              },
            );
          }
          throw UnimplementedError();
        case GetSubCategoriesEvent():
          emit(state.copyWith(subCategoriesRequestState: RequestState.loading));

          var result = await getSubCategoriesUseCase.call(event.categoryId);

          result.fold(
            (l) => emit(
              state.copyWith(
                subCategoriesRequestState: RequestState.error,
                subCategoriesFailure: l,
              ),
            ),
            (r) => emit(
              state.copyWith(
                subCategoriesRequestState: RequestState.success,
                subCategoriesResponseModel: r,
              ),
            ),
          );
      }
    });
  }
}
