// import 'package:json_annotation/json_annotation.dart';
//
// part 'order.g.dart';
//
// @JsonSerializable()
// class Order {
//   @JsonKey(name: "name")
//   String? name;
//
//   @JsonKey(name: "address")
//   String? address;
//
//   @JsonKey(name: "phoneNumber")
//   String? phoneNumber;
//
//   @JsonKey(name: "city")
//   String? city;
//
//   @JsonKey(name: "pin")
//   String? pin;
//
//   @JsonKey(name: "totalAmount")
//   double? totalAmount;
//
//   @JsonKey(name: "timestamp")
//   DateTime? timestamp;
//
//   Order({
//     this.name,
//     this.address,
//     this.phoneNumber,
//     this.city,
//     this.pin,
//     this.totalAmount,
//     this.timestamp,
//   });
//
//   factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
//   Map<String, dynamic> toJson() => _$OrderToJson(this);
// }
