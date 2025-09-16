import 'package:ecommerce_c15_str/features/cart/domain/entity/cart_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_response_model.g.dart';

@JsonSerializable()
class CartResponseModel extends CartResponseEntity {
  String? message;
  String? cartId;
  Data? data;

  CartResponseModel({
    required super.status,
    required this.message,
    required super.numOfCartItems,
    required this.cartId,
    required this.data,
  });

  factory CartResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CartResponseModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CartResponseModelToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: '_id')
  String? id;
  String? cartOwner;
  List<Products>? products;
  String? createdAt;
  String? updatedAt;
  @JsonKey(name: '__v')
  num? v;
  num? totalCartPrice;

  Data({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Products {
  num? count;
  @JsonKey(name: '_id')
  String? id;
  String? product;
  num? price;

  Products({this.count, this.id, this.product, this.price});

  factory Products.fromJson(Map<String, dynamic> json) =>
      _$ProductsFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsToJson(this);
}
