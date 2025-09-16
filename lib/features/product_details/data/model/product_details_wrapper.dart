import 'package:json_annotation/json_annotation.dart';
import 'product_details_response_model.dart';

part 'product_details_wrapper.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductDetailsWrapper {
  final ProductDetailsResponseModel? data;

  ProductDetailsWrapper({this.data});

  factory ProductDetailsWrapper.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsWrapperFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailsWrapperToJson(this);
}
