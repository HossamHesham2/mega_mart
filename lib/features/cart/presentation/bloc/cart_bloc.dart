import 'package:bloc/bloc.dart';
import 'package:ecommerce_c15_str/core/error/failures.dart';
import 'package:ecommerce_c15_str/features/cart/data/model/cart_request.dart';
import 'package:ecommerce_c15_str/features/cart/data/model/delete_cart_response_model.dart';
import 'package:ecommerce_c15_str/features/cart/data/model/get_cart_response_model.dart';
import 'package:ecommerce_c15_str/features/cart/domain/entity/cart_response_entity.dart';
import 'package:ecommerce_c15_str/features/cart/domain/usecase/add_to_cart_use_cas.dart';
import 'package:ecommerce_c15_str/features/cart/domain/usecase/delete_cart_use_case.dart';
import 'package:ecommerce_c15_str/features/cart/domain/usecase/get_cart_use_cas.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'cart_event.dart';

part 'cart_state.dart';

@injectable
class CartBloc extends Bloc<CartEvent, CartState> {
  AddToCartUseCas addToCartUseCas;
  GetCartUseCas getCartUseCas;
  DeleteCartUseCase deleteCartUseCase;

  CartBloc(this.addToCartUseCas, this.getCartUseCas, this.deleteCartUseCase)
    : super(CartState.initial()) {
    on<CartEvent>((event, emit) async {
      switch (event) {
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
        case GetCartEvent():
          {
            emit(state.copyWith(getCartRequestState: RequestState.loading));

            final result = await getCartUseCas.call();
            result.fold(
              (l) {
                return emit(
                  state.copyWith(
                    getCartRequestState: RequestState.error,
                    getCartFailures: l,
                  ),
                );
              },
              (r) {
                return emit(
                  state.copyWith(
                    getCartRequestState: RequestState.success,
                    getCartResponseModel: r,
                  ),
                );
              },
            );
          }
        case DeleteCartEvent():
          {
            emit(state.copyWith(deleteCartRequestState: RequestState.loading));

            final result = await deleteCartUseCase.call();
            result.fold(
              (l) {
                return emit(
                  state.copyWith(
                    deleteCartRequestState: RequestState.error,
                    deleteCartFailures: l,
                  ),
                );
              },
              (r) {
                return emit(
                  state.copyWith(
                    deleteCartRequestState: RequestState.success,
                    deleteCartResponseEntity: r,
                  ),
                );
              },
            );
          }
      }
    });
  }
}
