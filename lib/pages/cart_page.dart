import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ofsa_client_main/controller/purchase_controller.dart';
import 'package:ofsa_client_main/pages/payment_page.dart';

// import 'home_page.dart';
// import 'order_details_form.dart';
// // import '../../dump/razorpay_page.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PurchaseController>(
      builder: (ctrl) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Cart'),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  // Optionally handle logout
                },
                icon: const Icon(Icons.logout),
              ),
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Obx(() {
                  if (ctrl.cartItems.isEmpty) {
                    return const Center(child: Text('Your cart is empty'));
                  }
                  return ListView.builder(
                    itemCount: ctrl.cartItems.length,
                    itemBuilder: (context, index) {
                      final item = ctrl.cartItems[index];
                      return ListTile(
                        leading: Image.network(
                          item.image ?? 'https://example.com/fallback_image.png',
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                        title: Text(item.name ?? 'Unknown Product'),
                        subtitle: Text('Rs: ${item.price?.toStringAsFixed(2) ?? 'Unknown Price'}'),
                        trailing: IconButton(
                          icon: const Icon(Icons.remove_circle),
                          onPressed: () {
                            ctrl.removeFromCart(item);
                          },
                        ),
                      );
                    },
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Total: Rs ${ctrl.totalAmount.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      backgroundColor: Colors.indigo,
                    ),
                    child: const Text(
                      'Proceed to Payment',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>PaymentPage(),));
                      // ctrl.submitOrder();
                      // Get.to(
                      //       () => PaymentPage(),
                      //   arguments: {'amount': ctrl.totalAmount}, // Passing total amount to payment page
                      // );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
