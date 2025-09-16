import 'package:json_annotation/json_annotation.dart';
part 'cart_response_entity.g.dart';
@JsonSerializable()
class CartResponseEntity {
  final String status;
  final int numOfCartItems;

  CartResponseEntity({required this.status, required this.numOfCartItems});

  factory CartResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$CartResponseEntityFromJson(json);

  Map<String, dynamic> toJson()=>_$CartResponseEntityToJson(this);
}
