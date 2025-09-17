part of 'cart_bloc.dart';

class CartState extends Equatable {
  final RequestState? addToCartRequestState;
  final Failures? addToCartFailures;
  final CartResponseEntity? addToCartResponseEntity;

  final RequestState? getCartRequestState;
  final Failures? getCartFailures;
  final GetCartResponseModel? getCartResponseEntity;

  final RequestState? deleteCartRequestState;
  final Failures? deleteCartFailures;
  final DeleteCartResponseModel? deleteCartResponseEntity;

  const CartState({
    this.addToCartRequestState,
    this.addToCartResponseEntity,
    this.addToCartFailures,
    this.getCartResponseEntity,
    this.getCartRequestState,
    this.getCartFailures,
    this.deleteCartRequestState,
    this.deleteCartFailures,
    this.deleteCartResponseEntity,
  });

  factory CartState.initial() {
    return const CartState(
      addToCartRequestState: RequestState.initial,
      addToCartResponseEntity: null,
      addToCartFailures: null,
      getCartRequestState: RequestState.initial,
      getCartResponseEntity: null,
      getCartFailures: null,
      deleteCartFailures: null,
      deleteCartRequestState: RequestState.initial,
      deleteCartResponseEntity: null,
    );
  }

  CartState copyWith({
    RequestState? cartRequestState,
    Failures? cartFailures,
    CartResponseEntity? cartResponseEntity,
    RequestState? getCartRequestState,
    Failures? getCartFailures,
    GetCartResponseModel? getCartResponseModel,
    RequestState? deleteCartRequestState,
    Failures? deleteCartFailures,
    DeleteCartResponseModel? deleteCartResponseEntity,
  }) {
    return CartState(
      addToCartRequestState: cartRequestState ?? addToCartRequestState,
      addToCartFailures: cartFailures ?? addToCartFailures,
      addToCartResponseEntity: cartResponseEntity ?? addToCartResponseEntity,
      getCartRequestState: getCartRequestState ?? this.getCartRequestState,
      getCartFailures: getCartFailures ?? this.getCartFailures,
      getCartResponseEntity: getCartResponseModel ?? getCartResponseEntity,
      deleteCartRequestState:
          deleteCartRequestState ?? this.deleteCartRequestState,
      deleteCartFailures: deleteCartFailures ?? this.deleteCartFailures,
      deleteCartResponseEntity:
          deleteCartResponseEntity ?? this.deleteCartResponseEntity,
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
    deleteCartRequestState,
    deleteCartFailures,
    deleteCartResponseEntity,
  ];
}

enum RequestState { initial, loading, error, success }
