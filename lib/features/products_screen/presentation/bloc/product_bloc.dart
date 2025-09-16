import 'package:bloc/bloc.dart';
import 'package:ecommerce_c15_str/core/error/failures.dart';
import 'package:ecommerce_c15_str/features/cart/data/model/cart_request.dart';
import 'package:ecommerce_c15_str/features/cart/domain/entity/cart_response_entity.dart';
import 'package:ecommerce_c15_str/features/products_screen/data/model/product_response_model.dart';
import 'package:ecommerce_c15_str/features/products_screen/domain/usecases/add_to_cart_use_cas.dart';
import 'package:ecommerce_c15_str/features/products_screen/domain/usecases/get_product_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'product_event.dart';

part 'product_state.dart';

@injectable
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  GetProductUseCase getProductUseCase;
  AddToCartUseCas addToCartUseCas;

  ProductBloc(this.getProductUseCase, this.addToCartUseCas)
    : super(ProductState.initial()) {
    on<ProductEvent>((event, emit) async {
      switch (event) {
        case GetProductEvent():
          {
            try {
              emit(state.copyWith(productRequestState: RequestState.loading));
              var result = await getProductUseCase.call();
              result.fold(
                (l) {
                  print("Success");
                  emit(
                    state.copyWith(
                      productRequestState: RequestState.error,
                      productFailures: l,
                    ),
                  );
                },
                (r) => emit(
                  state.copyWith(
                    productRequestState: RequestState.success,
                    productResponseModel: r,
                  ),
                ),
              );
            } catch (e) {
              emit(
                state.copyWith(
                  productFailures: GeneralFailure(message: e.toString()),
                ),
              );
            }
          }
        case AddToCartEvent():
          {
            emit(state.copyWith(cartRequestState: RequestState.loading));

            final result = await addToCartUseCas.call(
              CartRequest(productId: event.id),
            );
            result.fold(
              (l) {
                return emit(
                  state.copyWith(
                    cartRequestState: RequestState.error,
                    cartFailures: l,
                  ),
                );
              },
              (r) {
                return emit(
                  state.copyWith(
                    cartRequestState: RequestState.success,
                    cartResponseEntity: r,
                  ),
                );
              },
            );
          }
      }
    });
  }
}
