import 'package:dio/dio.dart';
import 'package:ecommerce_c15_str/features/auth/login/data/models/login_response_model.dart';
import 'package:ecommerce_c15_str/features/auth/login/data/models/login_request.dart';
import 'package:ecommerce_c15_str/features/auth/sign_up/data/models/sign_up_request.dart';
import 'package:ecommerce_c15_str/features/auth/sign_up/data/models/sign_up_response_model.dart';
import 'package:ecommerce_c15_str/features/cart/data/model/cart_request.dart';
import 'package:ecommerce_c15_str/features/cart/data/model/cart_response_model.dart';
import 'package:ecommerce_c15_str/features/cart/data/model/get_cart_response_model.dart';
import 'package:ecommerce_c15_str/features/main_layout/categories/data/models/sub_categories_response_model.dart';
import 'package:ecommerce_c15_str/features/main_layout/home/data/model/brands_response_model.dart';
import 'package:ecommerce_c15_str/features/main_layout/home/data/model/categories_response_model.dart';
import 'package:ecommerce_c15_str/features/product_details/data/model/product_details_wrapper.dart';
import 'package:ecommerce_c15_str/features/products_screen/data/model/product_response_model.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

part 'commerce_client.g.dart';

@RestApi(baseUrl: 'https://ecommerce.routemisr.com/api/v1/')
abstract class CommerceClient {
  factory CommerceClient(Dio dio, {String? baseUrl}) = _CommerceClient;

  @POST('auth/signin')
  Future<LoginResponseModel> login(@Body() LoginRequest request);

  @POST('auth/signup')
  Future<SignUpResponseModel> signUp(@Body() SignUpRequest request);

  @GET('categories')
  Future<CategoriesResponseModel> getAllCategories();

  @GET('categories/{id}/subcategories')
  Future<SubCategoriesResponseModel> getAllSubCategories(
    @Path('id') String categoryId,
  );

  @GET('products')
  Future<ProductResponseModel> getProducts();

  @GET('products/{id}')
  Future<ProductDetailsWrapper> getProductsDetails(
    @Path('id') String productId,
  );

  @GET('brands')
  Future<BrandsResponseModel> getAllBrands();

  @POST('cart')
  Future<CartResponseModel> addToCart(
    @Body() CartRequest request,
    @Header('token') String token,
  );

  @GET('cart')
  Future<GetCartResponseModel> getCart(@Header('token') String token);
}

@module
abstract class DioModule {
  Dio get dio => Dio()
    ..interceptors.add(PrettyDioLogger(requestBody: true, responseBody: true));

  @lazySingleton
  CommerceClient get commerceClient =>
      CommerceClient(dio, baseUrl: 'https://ecommerce.routemisr.com/api/v1/');
}
