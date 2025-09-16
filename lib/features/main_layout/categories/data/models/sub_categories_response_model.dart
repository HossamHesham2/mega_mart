import 'package:json_annotation/json_annotation.dart';

part 'sub_categories_response_model.g.dart';

@JsonSerializable()
class SubCategoriesResponseModel {
  final int results;
  final Metadata metadata;
  final List<SubCategory> data;

  SubCategoriesResponseModel({
    required this.results,
    required this.metadata,
    required this.data,
  });

  factory SubCategoriesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SubCategoriesResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubCategoriesResponseModelToJson(this);
}

@JsonSerializable()
class Metadata {
  final int currentPage;
  final int numberOfPages;
  final int limit;

  Metadata({
    required this.currentPage,
    required this.numberOfPages,
    required this.limit,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);

  Map<String, dynamic> toJson() => _$MetadataToJson(this);
}

@JsonSerializable()
class SubCategory {
  @JsonKey(name: '_id')
  final String id;
  final String name;
  final String slug;
  final String category;
  final String createdAt;
  final String updatedAt;

  SubCategory({
    required this.id,
    required this.name,
    required this.slug,
    required this.category,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$SubCategoryToJson(this);
}
