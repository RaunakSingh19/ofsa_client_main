
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ofsa_client_main/models/product_category/product_category.dart';
import 'package:ofsa_client_main/pages/home_page.dart';
import '../models/product/product.dart';

class HomeController extends GetxController {
  // TextEditingController addressController = TextEditingController();
  // TextEditingController priceController = TextEditingController();
  // TextEditingController cardnumberController = TextEditingController();
  // TextEditingController expiryDateController = TextEditingController();
  // TextEditingController cardHolderNameController = TextEditingController();
  // TextEditingController cvvCodeController = TextEditingController();

  RxDouble productPrice = 0.0.obs;
  // final CollectionReference myorder =
  //     FirebaseFirestore.instance.collection("MyOrders");
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  late final CollectionReference productCollection;
  late final CollectionReference categoryCollection;

  List<Product> products = [];
  List<Product> productShowInUi = [];
  List<ProductCategory> productCategory = [];
  List<String> selectedBrands = [];

  @override
  Future<void> onInit() async {
    super.onInit();
    productCollection = firestore.collection('product');
    categoryCollection = firestore.collection('category');
    await fetchCategory();
    await fetchProducts();
  }

  // Future<void> StoreOrdersDetails() async {
  //   String address = addressController.text;
  //   double price = double.tryParse(priceController.text) ?? 0.0;
  //   String cardnumber = cardnumberController.text;
  //   String expairyDate = expiryDateController.text;
  //   String cardHolder = cardHolderNameController.text;
  //   String cvvCode = cvvCodeController.text;
  //
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


  Future<void> fetchProducts() async {
    try {
      QuerySnapshot productSnapshot = await productCollection.get();
      final List<Product> retrievedProducts = productSnapshot.docs
          .map((doc) => Product.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      products.clear();

      products.clear();
      products.assignAll(retrievedProducts);
      productShowInUi.assignAll(products);
      Get.snackbar('Success', 'Products fetched successfully',
          colorText: Colors.green);
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch products: $e',
          colorText: Colors.red);
      print(e);
    } finally {
      update();
    }
  }

  Future<void> fetchCategory() async {
    try {
      QuerySnapshot categorySnapshot = await categoryCollection.get();
      final List<ProductCategory> retrievedCategories = categorySnapshot.docs
          .map((doc) =>
              ProductCategory.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      productCategory.clear();
      productCategory.assignAll(retrievedCategories);
      // Get.snackbar('Success', 'Category fetched successfully', colorText: Colors.green);
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch categories: $e',
          colorText: Colors.red);
      print(e);
    } finally {
      update();
    }
  }

  void filterByCategory(String category) {
    productShowInUi.clear();
    productShowInUi =
        products.where((product) => product.category == category).toList();
    update();
  }

  void filterByBrand(List<String> selectedBrands) {
    if (selectedBrands.isEmpty) {
      productShowInUi = products;
    } else {
      productShowInUi = products
          .where((product) => selectedBrands.any(
              (brand) => product.brand?.toLowerCase() == brand.toLowerCase()))
          .toList();
    }
    update();
  }

  void sortByPrice({required bool ascending}) async {
    List<Product> sortedProducts = List<Product>.from(productShowInUi);
    sortedProducts.sort((a, b) => ascending
        ? a.price!.compareTo(b.price!)
        : b.price!.compareTo(a.price!));
    productShowInUi = sortedProducts;
    update();
  }

  void refreshHomePage() {
    fetchProducts();
    // refreshHomePage();
    // HomePage.// Fetch the products again
  }
}
