import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ofsa_client_main/models/product/product.dart';
import 'package:ofsa_client_main/pages/cart_page.dart';

class PurchaseController extends GetxController {
  TextEditingController addressController = TextEditingController();
  TextEditingController priceController=TextEditingController();
  // TextEditingController cardnumberController = TextEditingController();
  // TextEditingController expiryDateController = TextEditingController();
  // TextEditingController cardHolderNameController = TextEditingController();
  // TextEditingController cvvCodeController = TextEditingController();
  RxDouble productPrice = 0.0.obs;

  final CollectionReference myorder =
  FirebaseFirestore.instance.collection("MyOrders");

  RxList<Product> cartItems = <Product>[].obs;
  double get totalAmount => cartItems.fold(0, (sum, item) => sum + (item.price ?? 0));

  // Future<void> StoreOrdersDetails() async {
  //   String address = addressController.text;
  //   double price = double.tryParse(priceController.text) ?? 0.0;
  //   String cardnumber = cardnumberController.text;
  //   String expairyDate = expiryDateController.text;
  //   String cardHolder = cardHolderNameController.text;
  //   String cvvCode = cvvCodeController.text;

  //   try {
  //     await myorder.add({
  //       'address': address,
  //       'price': price,
  //       'cardnumber': cardnumber,
  //       'expairyDate': expairyDate,
  //       'cardHolder': cardHolder,
  //       'cvvCode': cvvCode
  //     });
  //     Get.snackbar('Success', 'Order stored successfully', colorText: Colors.green);
  //   } catch (e) {
  //     Get.snackbar('Error', 'Failed to store order: $e', colorText: Colors.red);
  //     print('Error storing order: $e');
  //   }
  // }

  @override
  void onInit() {
    super.onInit();
  }
// newly added function for adding this to firebase
  void updatePrice(double price) {
    productPrice.value = price;
  }
  String getAddress() {
    return addressController.text;
  }
// this will be the part under which i will work today
  @override
  void onClose() {
    addressController.dispose();
    super.onClose();
    // addressController.clear();
    // addressController.clear();
  }

  void addToCart(Product product) {
    cartItems.add(product);
  }

  void removeFromCart(Product product) {
    cartItems.remove(product);
    // addressController.clear();
  }

  Future<void> submitOrder() async {
    double amount = totalAmount;
    String address = addressController.text;

    // Validate address
    if (!isValidAddress(address)) {
      Get.snackbar('Error', 'Invalid address');
      return;
    }

    try {
      final response = await http.post(
        Uri.parse('http://localhost:3000/create-order'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'amount': amount, 'address': address}),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final String orderId = data['orderId'];

        // Handle successful payment
        _handlePaymentSuccess(orderId);
      } else {
        _handlePaymentError('Failed to create order');
      }
    } catch (e) {
      _handlePaymentError('Failed to connect to server: $e');
    }
  }

  bool isValidAddress(String address) {
    // Implement your address validation logic here
    // For example, you could use regular expressions or a validation library
    return address.isNotEmpty; // Basic validation for now

  }

  void _handlePaymentSuccess(String orderId) {
    Get.snackbar('Payment Success', 'Order ID: $orderId');
    cartItems.clear();
  }

  void _handlePaymentError(String message) {
    Get.snackbar('Payment Error', 'Error: $message');
  }


}
