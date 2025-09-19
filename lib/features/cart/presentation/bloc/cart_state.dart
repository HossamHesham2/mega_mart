part of 'cart_bloc.dart';

class CartState extends Equatable {
  final RequestState? addToCartRequestState;
  final Failures? addToCartFailures;
  final CartResponseEntity? addToCartResponseEntity;

  final RequestState? getCartRequestState;
  final Failures? getCartFailures;
  final GetCartResponseModel? getCartResponseModel;

  final RequestState? deleteCartRequestState;
  final Failures? deleteCartFailures;
  final DeleteCartResponseModel? deleteCartResponseEntity;

  const CartState({
    this.addToCartRequestState,
    this.addToCartResponseEntity,
    this.addToCartFailures,
    this.getCartResponseModel,
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
      getCartResponseModel: null,
      getCartFailures: null,
      deleteCartFailures: null,
      deleteCartRequestState: RequestState.initial,
      deleteCartResponseEntity: null,
    );
  }

  CartState copyWith({
    RequestState? addToCartRequestState,
    Failures? addToCartFailures,
    CartResponseEntity? addToCartResponseEntity,
    RequestState? getCartRequestState,
    Failures? getCartFailures,
    GetCartResponseModel? getCartResponseModel,
    RequestState? deleteCartRequestState,
    Failures? deleteCartFailures,
    DeleteCartResponseModel? deleteCartResponseEntity,
  }) {
    return CartState(
      addToCartRequestState: addToCartRequestState ?? this.addToCartRequestState,
      addToCartFailures: addToCartFailures ?? this.addToCartFailures,
      addToCartResponseEntity:
      addToCartResponseEntity ?? this.addToCartResponseEntity,
      getCartRequestState: getCartRequestState ?? this.getCartRequestState,
      getCartFailures: getCartFailures ?? this.getCartFailures,
      getCartResponseModel: getCartResponseModel ?? this.getCartResponseModel,
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
    getCartResponseModel,
    deleteCartRequestState,
    deleteCartFailures,
    deleteCartResponseEntity,
  ];
}

enum RequestState { initial, loading, error, success }
