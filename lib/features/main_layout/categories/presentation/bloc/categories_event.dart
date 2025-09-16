part of 'categories_bloc.dart';

sealed class CategoriesEvent extends Equatable {}

class GetCategoriesEvent extends CategoriesEvent {
  @override
  List<Object?> get props => [];
}

class GetSubCategoriesEvent extends CategoriesEvent {
  final String categoryId;
   GetSubCategoriesEvent({required this.categoryId});
  @override
  List<Object?> get props => [categoryId];
}