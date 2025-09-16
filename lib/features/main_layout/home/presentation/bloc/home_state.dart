part of 'home_bloc.dart';

class HomeState extends Equatable {
  final RequestState? categoriesRequestState;
  final RequestState? brandsRequestState;
  final CategoriesResponseModel? categoriesResponseModel;
  final BrandsResponseModel? brandsResponseModel;
  final Failures? categoriesFailures;
  final Failures? brandsFailures;

  const HomeState({
    this.categoriesRequestState,
    this.brandsRequestState,
    this.categoriesResponseModel,
    this.categoriesFailures,
    this.brandsResponseModel,
    this.brandsFailures,
  });

  factory HomeState.initial() {
    return HomeState(
      categoriesRequestState: RequestState.init,
      brandsRequestState: RequestState.init,
      categoriesResponseModel: null,
      brandsResponseModel: null,
      categoriesFailures: null,
      brandsFailures: null,
    );
  }

  HomeState copyWith({
    RequestState? categoriesRequestState,
    RequestState? brandsRequestState,
    CategoriesResponseModel? categoriesResponseModel,
    BrandsResponseModel? brandsResponseModel,
    Failures? categoriesFailures,
    Failures? brandsFailures,
  }) {
    return HomeState(
      categoriesRequestState:
          categoriesRequestState ?? this.categoriesRequestState,
      brandsRequestState: brandsRequestState ?? this.brandsRequestState,
      categoriesResponseModel:
          categoriesResponseModel ?? this.categoriesResponseModel,
      brandsResponseModel: brandsResponseModel ?? this.brandsResponseModel,
      categoriesFailures: categoriesFailures ?? this.categoriesFailures,
      brandsFailures: brandsFailures ?? this.brandsFailures,
    );
  }

  @override
  List<Object?> get props => [
    categoriesRequestState,
    brandsRequestState,
    categoriesResponseModel,
    brandsResponseModel,
    categoriesFailures,
    brandsFailures,
  ];
}

enum RequestState { init, success, error, loading }
