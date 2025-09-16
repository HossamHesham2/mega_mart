part of 'product_details_bloc.dart';

sealed class ProductDetailsEvent extends Equatable {
  const ProductDetailsEvent();
}

class GetProductDetailsEvent extends ProductDetailsEvent {
  final String id;

  const GetProductDetailsEvent({required this.id});

  @override
  List<Object?> get props => [id];
}
