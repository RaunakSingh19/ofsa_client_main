// import 'package:json_annotation/json_annotation.dart';
// part 'user.g.dart';
//
// @JsonSerializable()
// class User{
//   @JsonKey(name:"id")
//   String? id;
//
//   @JsonKey(name:"name")
//   String? name;
//
//   @JsonKey(name:"number")
//   int? number;
//
//
//
//   User({
//     this.id,
//     this.name,
//     this.number,
//
//
// });
//   factory User.fromJson(Map<String , dynamic> json) => _$UserFromJson(json);
//   Map<String,dynamic> toJson()=> _$UserToJson(this);
//
//
// }
//
//

import 'package:json_annotation/json_annotation.dart';

part 'product_category.g.dart';

@JsonSerializable()
class ProductCategory {
  @JsonKey(name: "id")
  String? id;

  @JsonKey(name: "name")
  String? name;



  ProductCategory({
    this.id,
    this.name,
  // Add the email parameter in the constructor
  });

  factory ProductCategory.fromJson(Map<String, dynamic> json) => _$ProductCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$ProductCategoryToJson(this);
}

//always run "flutter pub run build_runner build" this command after changing anything to this file without fail