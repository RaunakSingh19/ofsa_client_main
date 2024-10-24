// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';
//
// class PaymentSuccessController extends GetxController{
//   final FirebaseFirestore firestore = FirebaseFirestore.instance;
//
//   // Future<void> fetchProducts() async {
//   //   try {
//   //     QuerySnapshot productSnapshot = await productCollection.get();
//   //     final List<Product> retrievedProducts = productSnapshot.docs.map((doc) =>
//   //         Product.fromJson(doc.data() as Map<String, dynamic>)).toList();
//   //
//   //     products.clear();
//   //     products.assignAll(retrievedProducts);
//   //     productShowInUi.assignAll(products);
//   //     Get.snackbar('Success', 'Products fetched successfully', colorText: Colors.green);
//   //   } catch (e) {
//   //     Get.snackbar('Error', 'Failed to fetch products: $e', colorText: Colors.red);
//   //     print(e);
//   //   } finally {
//   //     update();
//   //   }
//   // }
//   // fetchorder(){
//   //
//   // }
// void onInit(){
//   super.onInit();
// }
//
// }