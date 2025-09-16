part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent();
}

class GetProductEvent extends ProductEvent {
  @override
  List<Object?> get props => [];
}

class AddToCartEvent extends ProductEvent {
  final String id;

  const AddToCartEvent({required this.id});

  @override
  List<Object?> get props => [];
}
