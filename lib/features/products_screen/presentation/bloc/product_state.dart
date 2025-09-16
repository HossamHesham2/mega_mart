part of 'product_bloc.dart';

class ProductState extends Equatable {
  final RequestState? productRequestState;
  final ProductResponseModel? productResponseModel;
  final Failures? productFailures;

  final RequestState? addToCartRequestState;
  final Failures? addToCartFailures;
  final CartResponseEntity? addToCartResponseEntity;

  const ProductState({
    this.productRequestState,
    this.productResponseModel,
    this.productFailures,
    this.addToCartRequestState,
    this.addToCartResponseEntity,
    this.addToCartFailures,
  });

  // initial state
  factory ProductState.initial() {
    return const ProductState(
      productRequestState: RequestState.loading,
      productResponseModel: null,
      productFailures: null,
      addToCartRequestState: RequestState.loading,
      addToCartResponseEntity: null,
      addToCartFailures: null,
    );
  }

  ProductState copyWith({
    RequestState? productRequestState,
    ProductResponseModel? productResponseModel,
    Failures? productFailures,
    RequestState? cartRequestState,
    Failures? cartFailures,
    CartResponseEntity? cartResponseEntity,
  }) {
    return ProductState(
      productRequestState: productRequestState ?? this.productRequestState,
      productResponseModel: productResponseModel ?? this.productResponseModel,
      productFailures: productFailures ?? this.productFailures,
      addToCartRequestState: cartRequestState ?? addToCartRequestState,
      addToCartFailures: cartFailures ?? addToCartFailures,
      addToCartResponseEntity:
          cartResponseEntity ?? addToCartResponseEntity,
    );
  }

  @override
  List<Object?> get props => [
    productRequestState,
    productResponseModel,
    productFailures,
    addToCartRequestState,
    addToCartResponseEntity,
    addToCartFailures,
  ];
}

enum RequestState { initial, loading, error, success }
