// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:ofsa_client_main/models/product/product.dart';
//
// class PurchaseController extends GetxController {
//   // TextEditingController addressController = TextEditingController();
//   List<Product> cartItems = [];
//   // RxList<Product> cartItems = <Product>[].obs;
//   double get totalAmount => cartItems.fold(0, (sum, item) => sum + (item.price ?? 0));
//
//   void addToCart(Product product) {
//     cartItems.add(product);
//     update(); // To update the UI
//   }
//   // void onClose() {
//   //   addressController.dispose();
//   //   super.onClose();
//   //   // addressController.clear();
//   //   // addressController.clear();
//   // }
//   // void addToCart(Product product) {
//   //   cartItems.add(product);
//   // }
//
//   void removeFromCart(Product product) {
//     cartItems.remove(product);
//     update();
//   }
//
//   // double get totalAmount {
//   //   return cartItems.fold(0, (sum, item) => sum + (item.price ?? 0));
//   // }
//
//   saveOrderToFirebase(
//       {required String cardNumber,
//       required String cardHolderName,
//       required String expiryDate,
//       required String cvvCode}) {}
//
//   static void refreshHomePage() {
//     // addressController.clear();
//     // cartItems.clear();
//   }
// }
