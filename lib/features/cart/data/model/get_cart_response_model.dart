import 'package:json_annotation/json_annotation.dart';

part 'get_cart_response_model.g.dart';

@JsonSerializable()
class GetCartResponseModel {
  String? status;
  num? numOfCartItems;
  String? cartId;
  Data? data;

  GetCartResponseModel({this.status, this.numOfCartItems, this.cartId, this.data});

  factory GetCartResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetCartResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetCartResponseModelToJson(this);
}

@JsonSerializable()
class Data {
  String? id;
  String? cartOwner;
  List<Products>? products;
  String? createdAt;
  String? updatedAt;
  num? v;
  num? totalCartPrice;

  Data({this.id, this.cartOwner, this.products, this.createdAt, this.updatedAt, this.v, this.totalCartPrice});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Products {
  num? count;
  String? id;
  Product? product;
  num? price;

  Products({this.count, this.id, this.product, this.price});

  factory Products.fromJson(Map<String, dynamic> json) => _$ProductsFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsToJson(this);
}

@JsonSerializable()
class Product {
  List<Subcategory>? subcategory;
  String? id;
  String? title;
  num? quantity;
  String? imageCover;
  Category? category;
  Brand? brand;
  num? ratingsAverage;

  Product({
    this.subcategory,
    this.id,
    this.title,
    this.quantity,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
  });

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

@JsonSerializable()
class Brand {
  String? id;
  String? name;
  String? slug;
  String? image;

  Brand({this.id, this.name, this.slug, this.image});

  factory Brand.fromJson(Map<String, dynamic> json) => _$BrandFromJson(json);

  Map<String, dynamic> toJson() => _$BrandToJson(this);
}

@JsonSerializable()
class Category {
  String? id;
  String? name;
  String? slug;
  String? image;

  Category({this.id, this.name, this.slug, this.image});

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable()
class Subcategory {
  String? id;
  String? name;
  String? slug;
  String? category;

  Subcategory({this.id, this.name, this.slug, this.category});

  factory Subcategory.fromJson(Map<String, dynamic> json) => _$SubcategoryFromJson(json);

  Map<String, dynamic> toJson() => _$SubcategoryToJson(this);
}
