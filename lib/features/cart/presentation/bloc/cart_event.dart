part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();
}

class AddToCartEvent extends CartEvent {
  final String id;

  const AddToCartEvent({required this.id});

  @override
  List<Object?> get props => [id];
}

class GetCartEvent extends CartEvent {
  @override
  List<Object?> get props => [];
}

class DeleteCartEvent extends CartEvent {
  @override
  List<Object?> get props => [];
}