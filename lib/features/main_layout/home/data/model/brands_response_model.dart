import 'package:json_annotation/json_annotation.dart';

part 'brands_response_model.g.dart';

@JsonSerializable()
class BrandsResponseModel {
  final int results;
  final Metadata metadata;
  final List<Brand> data;

  BrandsResponseModel({
    required this.results,
    required this.metadata,
    required this.data,
  });

  factory BrandsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BrandsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$BrandsResponseModelToJson(this);
}

@JsonSerializable()
class Metadata {
  final int currentPage;
  final int numberOfPages;
  final int limit;
  final int? nextPage;

  Metadata({
    required this.currentPage,
    required this.numberOfPages,
    required this.limit,
    this.nextPage,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);

  Map<String, dynamic> toJson() => _$MetadataToJson(this);
}

@JsonSerializable()
class Brand {
  @JsonKey(name: '_id')
  final String id;
  final String name;
  final String slug;
  final String image;
  final String createdAt;
  final String updatedAt;

  Brand({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => _$BrandFromJson(json);

  Map<String, dynamic> toJson() => _$BrandToJson(this);
}
