part of 'product_bloc.dart';

class ProductState extends Equatable {
  final RequestState? productRequestState;
  final ProductResponseModel? productResponseModel;
  final Failures? productFailures;

  const ProductState({
    this.productRequestState,
    this.productResponseModel,
    this.productFailures,
  });

  // initial state
  factory ProductState.initial() {
    return const ProductState(
      productRequestState: RequestState.loading,
      productResponseModel: null,
      productFailures: null,
    );
  }

  ProductState copyWith({
    RequestState? productRequestState,
    ProductResponseModel? productResponseModel,
    Failures? productFailures,
  }) {
    return ProductState(
      productRequestState: productRequestState ?? this.productRequestState,
      productResponseModel: productResponseModel ?? this.productResponseModel,
      productFailures: productFailures ?? this.productFailures,
    );
  }

  @override
  List<Object?> get props => [
    productRequestState,
    productResponseModel,
    productFailures,
  ];
}

enum RequestState { initial, loading, error, success }
