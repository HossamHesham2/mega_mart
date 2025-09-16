// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/login/data/datasources/login_remote_ds.dart'
    as _i342;
import '../../features/auth/login/data/datasources/login_remote_ds_impl.dart'
    as _i797;
import '../../features/auth/login/data/reposiotry/login_repository_impl.dart'
    as _i918;
import '../../features/auth/login/domain/repository/login_repository.dart'
    as _i354;
import '../../features/auth/login/domain/usecases/login_usecase.dart' as _i401;
import '../../features/auth/login/presentation/bloc/login_bloc.dart' as _i885;
import '../../features/auth/sign_up/data/datasources/sign_up_remote_ds.dart'
    as _i177;
import '../../features/auth/sign_up/data/datasources/sign_up_remote_ds_impl.dart'
    as _i708;
import '../../features/auth/sign_up/data/reposiotry/sign_up_repository_impl.dart'
    as _i120;
import '../../features/auth/sign_up/domain/repository/sign_up_repository.dart'
    as _i988;
import '../../features/auth/sign_up/domain/usecases/sign_up_use_case.dart'
    as _i365;
import '../../features/auth/sign_up/presentation/bloc/sign_up_bloc.dart'
    as _i130;
import '../../features/cart/data/data_source/cart_remote_ds.dart' as _i1012;
import '../../features/cart/data/repository/cart_repository_impl.dart'
    as _i1063;
import '../../features/cart/domain/repository/cart_repository.dart' as _i26;
import '../../features/cart/domain/usecase/add_to_cart_use_cas.dart' as _i457;
import '../../features/cart/domain/usecase/get_cart_use_cas.dart' as _i662;
import '../../features/cart/presentation/bloc/cart_bloc.dart' as _i517;
import '../../features/main_layout/categories/data/data_source/categories_remote_ds.dart'
    as _i410;
import '../../features/main_layout/categories/data/repository/categories_repository_impl.dart'
    as _i215;
import '../../features/main_layout/categories/domain/repository/categories_repository.dart'
    as _i609;
import '../../features/main_layout/categories/domain/usecases/get_sub_categories_use_case.dart'
    as _i282;
import '../../features/main_layout/categories/presentation/bloc/categories_bloc.dart'
    as _i72;
import '../../features/main_layout/home/data/data_source/home_remote_ds.dart'
    as _i944;
import '../../features/main_layout/home/data/repository/home_repository_impl.dart'
    as _i70;
import '../../features/main_layout/home/domain/repository/home_repository.dart'
    as _i556;
import '../../features/main_layout/home/domain/usecases/get_all_brands_use_case.dart'
    as _i1072;
import '../../features/main_layout/home/domain/usecases/get_all_categories_use_case.dart'
    as _i791;
import '../../features/main_layout/home/presentation/bloc/home_bloc.dart'
    as _i53;
import '../../features/product_details/data/data_source/product_details_remote_ds.dart'
    as _i367;
import '../../features/product_details/data/repository/product_details_repository_impl.dart'
    as _i620;
import '../../features/product_details/domain/repository/product_details_repository.dart'
    as _i747;
import '../../features/product_details/domain/usecase/get_product_details_use_case.dart'
    as _i37;
import '../../features/product_details/presentation/bloc/product_details_bloc.dart'
    as _i490;
import '../../features/products_screen/data/data_source/product_remote_ds.dart'
    as _i530;
import '../../features/products_screen/data/repository/product_repository_impl.dart'
    as _i99;
import '../../features/products_screen/domain/repository/product_repository.dart'
    as _i744;
import '../../features/products_screen/domain/usecases/add_to_cart_use_cas.dart'
    as _i531;
import '../../features/products_screen/domain/usecases/get_product_use_case.dart'
    as _i630;
import '../../features/products_screen/presentation/bloc/product_bloc.dart'
    as _i923;
import '../network/commerce_client.dart' as _i85;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.factory<_i361.Dio>(() => dioModule.dio);
    gh.lazySingleton<_i85.CommerceClient>(() => dioModule.commerceClient);
    gh.factory<_i530.ProductRemoteDs>(() => _i530.ProductRemoteDsImpl());
    gh.factory<_i744.ProductRepository>(
      () => _i99.ProductRepositoryImpl(gh<_i530.ProductRemoteDs>()),
    );
    gh.factory<_i1012.CartRemoteDs>(() => _i1012.CartRemoteDsImpl());
    gh.factory<_i342.LoginRemoteDS>(() => _i797.LoginRemoteDSImpl());
    gh.factory<_i26.CartRepository>(
      () => _i1063.CartRepositoryImpl(gh<_i1012.CartRemoteDs>()),
    );
    gh.factory<_i177.SignUpRemoteDs>(() => _i708.SignUpRemoteDsImpl());
    gh.factory<_i944.HomeRemoteDs>(() => _i944.HomeRemoteDsImpl());
    gh.factory<_i367.ProductDetailsRemoteDs>(
      () => _i367.ProductDetailsRemoteDsImpl(),
    );
    gh.factory<_i410.CategoriesRemoteDs>(() => _i410.CategoriesRemoteDsImpl());
    gh.factory<_i556.HomeRepository>(
      () => _i70.HomeRepositoryImpl(gh<_i944.HomeRemoteDs>()),
    );
    gh.factory<_i457.AddToCartUseCas>(
      () => _i457.AddToCartUseCas(gh<_i26.CartRepository>()),
    );
    gh.factory<_i662.GetCartUseCas>(
      () => _i662.GetCartUseCas(gh<_i26.CartRepository>()),
    );
    gh.factory<_i630.GetProductUseCase>(
      () => _i630.GetProductUseCase(gh<_i744.ProductRepository>()),
    );
    gh.factory<_i531.AddToCartUseCas>(
      () => _i531.AddToCartUseCas(gh<_i744.ProductRepository>()),
    );
    gh.factory<_i988.SignUpRepository>(
      () => _i120.SignUpRepositoryImpl(gh<_i177.SignUpRemoteDs>()),
    );
    gh.factory<_i517.CartBloc>(
      () => _i517.CartBloc(
        gh<_i457.AddToCartUseCas>(),
        gh<_i662.GetCartUseCas>(),
      ),
    );
    gh.factory<_i923.ProductBloc>(
      () => _i923.ProductBloc(
        gh<_i630.GetProductUseCase>(),
        gh<_i531.AddToCartUseCas>(),
      ),
    );
    gh.factory<_i354.LoginRepository>(
      () => _i918.LoginRepositoryImpl(gh<_i342.LoginRemoteDS>()),
    );
    gh.factory<_i365.SignUpUseCase>(
      () => _i365.SignUpUseCase(gh<_i988.SignUpRepository>()),
    );
    gh.factory<_i130.SignUpBloc>(
      () => _i130.SignUpBloc(gh<_i365.SignUpUseCase>()),
    );
    gh.factory<_i401.LoginUseCase>(
      () => _i401.LoginUseCase(gh<_i354.LoginRepository>()),
    );
    gh.factory<_i609.CategoriesRepository>(
      () => _i215.CategoriesRepositoryImpl(gh<_i410.CategoriesRemoteDs>()),
    );
    gh.factory<_i747.ProductDetailsRepository>(
      () => _i620.ProductDetailsRepositoryImpl(
        gh<_i367.ProductDetailsRemoteDs>(),
      ),
    );
    gh.factory<_i791.GetCategoriesUseCase>(
      () => _i791.GetCategoriesUseCase(gh<_i556.HomeRepository>()),
    );
    gh.factory<_i1072.GetAllBrandsUseCase>(
      () => _i1072.GetAllBrandsUseCase(gh<_i556.HomeRepository>()),
    );
    gh.factory<_i37.GetProductDetailsUseCase>(
      () => _i37.GetProductDetailsUseCase(gh<_i747.ProductDetailsRepository>()),
    );
    gh.factory<_i885.AuthBloc>(() => _i885.AuthBloc(gh<_i401.LoginUseCase>()));
    gh.factory<_i282.GetSubCategoriesUseCase>(
      () => _i282.GetSubCategoriesUseCase(gh<_i609.CategoriesRepository>()),
    );
    gh.factory<_i490.ProductDetailsBloc>(
      () => _i490.ProductDetailsBloc(gh<_i37.GetProductDetailsUseCase>()),
    );
    gh.factory<_i53.HomeBloc>(
      () => _i53.HomeBloc(
        gh<_i791.GetCategoriesUseCase>(),
        gh<_i1072.GetAllBrandsUseCase>(),
      ),
    );
    gh.factory<_i72.CategoriesBloc>(
      () => _i72.CategoriesBloc(
        gh<_i791.GetCategoriesUseCase>(),
        gh<_i282.GetSubCategoriesUseCase>(),
      ),
    );
    return this;
  }
}

class _$DioModule extends _i85.DioModule {}
