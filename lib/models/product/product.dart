import 'package:json_annotation/json_annotation.dart';
part 'product.g.dart';

@JsonSerializable()
class Product {
  @JsonKey(name:"id")
  String? id;

  @JsonKey(name:"name")
  String? name;

  @JsonKey(name:"description")
  String? description;

  @JsonKey(name:"category")
  String? category;

  @JsonKey(name:"image")
  String? image;

  @JsonKey(name:"price")
  double? price;

  @JsonKey(name:"brand")
  String? brand;

  @JsonKey(name:"offer")
  bool? offer;

  @JsonKey(name:"quantity") // Add this line
  int? quantity; // Add this line

  Product({
    this.id,
    this.name,
    this.description,
    this.category,
    this.image,
    this.offer,
    this.price,
    this.brand,
    this.quantity, // Add this line
  });

  factory Product.fromJson(Map<String , dynamic> json) => _$ProductFromJson(json);
  Map<String,dynamic> toJson()=> _$ProductToJson(this);
}
