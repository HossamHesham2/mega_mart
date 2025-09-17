import 'package:json_annotation/json_annotation.dart';

part 'delete_cart_response_model.g.dart';

@JsonSerializable()
class DeleteCartResponseModel {
  final String? message;

  DeleteCartResponseModel({this.message});

  factory DeleteCartResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DeleteCartResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteCartResponseModelToJson(this);
}
