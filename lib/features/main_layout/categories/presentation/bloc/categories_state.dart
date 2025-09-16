part of 'categories_bloc.dart';

class CategoriesState extends Equatable {
  final RequestState? categoriesRequestState;
  final RequestState? subCategoriesRequestState;
  final CategoriesResponseModel? categoriesResponseModel;
  final SubCategoriesResponseModel? subCategoriesResponseModel;
  final Failures? categoriesFailure;
  final Failures? subCategoriesFailure;

  const CategoriesState({
    this.categoriesRequestState,
    this.subCategoriesRequestState,
    this.categoriesResponseModel,
    this.subCategoriesResponseModel,
    this.categoriesFailure,
    this.subCategoriesFailure,
  });

  factory CategoriesState.initState() {
    return CategoriesState(
      categoriesRequestState: RequestState.initial,
      subCategoriesRequestState: RequestState.initial,
      categoriesResponseModel: null,
      subCategoriesResponseModel: null,
      categoriesFailure: null,
      subCategoriesFailure: null,
    );
  }

  /// copyWith
  CategoriesState copyWith({
    RequestState? categoriesRequestState,
    RequestState? subCategoriesRequestState,
    CategoriesResponseModel? categoriesResponseModel,
    SubCategoriesResponseModel? subCategoriesResponseModel,
    Failures? categoriesFailure,
    Failures? subCategoriesFailure,
  }) {
    return CategoriesState(
      categoriesRequestState:
          categoriesRequestState ?? this.categoriesRequestState,
      subCategoriesRequestState:
          subCategoriesRequestState ?? this.subCategoriesRequestState,
      categoriesResponseModel:
          categoriesResponseModel ?? this.categoriesResponseModel,
      subCategoriesResponseModel:
          subCategoriesResponseModel ?? this.subCategoriesResponseModel,
      categoriesFailure: categoriesFailure ?? this.categoriesFailure,
      subCategoriesFailure: subCategoriesFailure ?? this.subCategoriesFailure,
    );
  }

  @override
  List<Object?> get props => [
    categoriesRequestState,
    subCategoriesRequestState,
    categoriesResponseModel,
    subCategoriesResponseModel,
    categoriesFailure,
    subCategoriesFailure,
  ];
}

final class CategoriesInitial extends CategoriesState {
  @override
  List<Object> get props => [];
}

enum RequestState { initial, loading, success, error }
