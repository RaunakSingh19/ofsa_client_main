import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ofsa_client_main/controller/purchase_controller.dart';
import 'package:ofsa_client_main/models/product/product.dart';
import 'package:ofsa_client_main/pages/cart_page.dart'; // Import the CartPage

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Product? product = Get.arguments['data'] as Product?;

    if (product == null) {
      return Scaffold(
        body: const Center(child: Text('Product not found')),
      );
    }

    return GetBuilder<PurchaseController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Product Details'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                // Add logout functionality here
              },
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  product.image ?? 'https://example.com/fallback_image.png',
                  fit: BoxFit.contain,
                  width: double.infinity,
                  height: 200,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                product.name ?? 'Unknown Product',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                product.description ?? 'No description available',
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Rs: ${product.price?.toStringAsFixed(2) ?? 'Unknown Price'}',
                style: const TextStyle(
                  color: Colors.green,
                  fontSize: 20,
                  height: 1.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: ctrl.addressController,
                maxLines: 3,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  labelText: 'Enter your billing address',


                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: Colors.indigo,
                  ),
                  child: const Text(
                    'Add to Cart',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  onPressed: () {
                    ctrl.addToCart(product);
                    Get.to(() => CartPage());
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

