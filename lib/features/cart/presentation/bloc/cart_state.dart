part of 'cart_bloc.dart';

class CartState extends Equatable {
  final RequestState? addToCartRequestState;
  final Failures? addToCartFailures;
  final CartResponseEntity? addToCartResponseEntity;

  final RequestState? getCartRequestState;
  final Failures? getCartFailures;
  final GetCartResponseModel? getCartResponseEntity;

  const CartState({
    this.addToCartRequestState,
    this.addToCartResponseEntity,
    this.addToCartFailures,
    this.getCartRequestState,
    this.getCartFailures,
    this.getCartResponseEntity,
  });

  factory CartState.initial() {
    return const CartState(
      addToCartRequestState: RequestState.loading,
      addToCartResponseEntity: null,
      addToCartFailures: null,
      getCartRequestState: RequestState.loading,

      getCartResponseEntity: null,
      getCartFailures: null,
    );
  }

  /// copyWith
  CartState copyWith({
    RequestState? cartRequestState,
    Failures? cartFailures,
    CartResponseEntity? cartResponseEntity,
    RequestState? getCartRequestState,
    Failures? getCartFailures,
    GetCartResponseModel? getCartResponseModel,
  }) {
    return CartState(
      addToCartRequestState: cartRequestState ?? addToCartRequestState,
      addToCartFailures: cartFailures ?? addToCartFailures,
      addToCartResponseEntity:
          cartResponseEntity ?? addToCartResponseEntity,
      getCartRequestState: getCartRequestState ?? this.getCartRequestState,
      getCartFailures: getCartFailures ?? this.getCartFailures,
      getCartResponseEntity:
          getCartResponseModel ?? getCartResponseEntity,
    );
  }

  @override
  List<Object?> get props => [
    addToCartRequestState,
    addToCartResponseEntity,
    addToCartFailures,
    getCartRequestState,
    getCartFailures,
    getCartResponseEntity,
  ];
}

enum RequestState { initial, loading, error, success }
