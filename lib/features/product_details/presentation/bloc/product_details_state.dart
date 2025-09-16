part of 'product_details_bloc.dart';

class ProductDetailsState extends Equatable {
  final RequestState? productDetailsRequestState;
  final ProductDetailsWrapper? productDetailsResponseModel;
  final Failures? productDetailsFailures;

  const ProductDetailsState({
    this.productDetailsRequestState,
    this.productDetailsResponseModel,
    this.productDetailsFailures,
  });

  // initial state
  factory ProductDetailsState.initial() {
    return const ProductDetailsState(
      productDetailsRequestState: RequestState.initial,
      productDetailsResponseModel: null,
      productDetailsFailures: null,
    );
  }

  // copyWith
  ProductDetailsState copyWith({
    RequestState? productDetailsRequestState,
    ProductDetailsWrapper? productDetailsResponseModel,
    Failures? productDetailsFailures,
  }) {
    return ProductDetailsState(
      productDetailsRequestState:
          productDetailsRequestState ?? this.productDetailsRequestState,
      productDetailsResponseModel:
          productDetailsResponseModel ?? this.productDetailsResponseModel,
      productDetailsFailures:
          productDetailsFailures ?? this.productDetailsFailures,
    );
  }

  @override
  List<Object?> get props => [
    productDetailsRequestState,
    productDetailsResponseModel,
    productDetailsFailures,
  ];
}

enum RequestState { initial, loading, error, success }
