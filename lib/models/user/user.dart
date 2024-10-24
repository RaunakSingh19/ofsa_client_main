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

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: "id")
  String? id;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "number")
  int? number;

  @JsonKey(name: "email")  // Add the email field here
  String? email;

  User({
    this.id,
    this.name,
    this.number,
    this.email,  // Add the email parameter in the constructor
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

//always run "flutter pub run build_runner build" this command after changing anything to this file without fail