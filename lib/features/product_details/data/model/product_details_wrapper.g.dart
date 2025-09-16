// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details_wrapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailsWrapper _$ProductDetailsWrapperFromJson(
  Map<String, dynamic> json,
) => ProductDetailsWrapper(
  data: json['data'] == null
      ? null
      : ProductDetailsResponseModel.fromJson(
          json['data'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$ProductDetailsWrapperToJson(
  ProductDetailsWrapper instance,
) => <String, dynamic>{'data': instance.data?.toJson()};
