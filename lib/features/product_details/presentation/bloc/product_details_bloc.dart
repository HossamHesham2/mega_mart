import 'package:bloc/bloc.dart';
import 'package:ecommerce_c15_str/core/error/failures.dart';
import 'package:ecommerce_c15_str/features/product_details/data/model/product_details_wrapper.dart';
import 'package:ecommerce_c15_str/features/product_details/domain/usecase/get_product_details_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'product_details_event.dart';

part 'product_details_state.dart';

@injectable
class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  GetProductDetailsUseCase getProductDetailsUseCase;

  ProductDetailsBloc(this.getProductDetailsUseCase)
    : super(ProductDetailsState.initial()) {
    on<ProductDetailsEvent>((event, emit) async {
      switch (event) {
        case GetProductDetailsEvent():
          {
            try {
              emit(
                state.copyWith(
                  productDetailsRequestState: RequestState.loading,
                ),
              );
              final result = await getProductDetailsUseCase(event.id);

              result.fold(
                (failure) => emit(
                  state.copyWith(
                    productDetailsRequestState: RequestState.error,
                    productDetailsFailures: failure,
                  ),
                ),
                (response) => emit(
                  state.copyWith(
                    productDetailsRequestState: RequestState.success,
                    productDetailsResponseModel: response,
                  ),
                ),
              );
            } on Exception catch (e) {
              emit(
                state.copyWith(
                  productDetailsRequestState: RequestState.error,
                  productDetailsFailures: GeneralFailure(message: e.toString()),
                ),
              );
            }
          }
      }
    });
  }
}
