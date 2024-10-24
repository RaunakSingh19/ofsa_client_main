import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ofsa_client_main/pages/home_page.dart';
import '../controller/purchase_controller.dart';

class OrderDetailsPage extends StatefulWidget {
  const OrderDetailsPage({super.key});

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  final cityController = TextEditingController();
  final pincodeController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Form field variables
  String name = '';
  String address = '';
  String phoneNumber = '';
  String city = '';
  String pin = '';

  final PurchaseController cartController = Get.find(); // Fetch the cart controller

  // Reference Firestore instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Function to create a document in Firestore collection
  Future<void> addOrderToFirestore(Map<String, dynamic> orderData) async {
    try {
      await _firestore.collection('orders').add(orderData);
      print("Order added successfully!");
    } catch (e) {
      print("Failed to add order: $e");
    }
  }

  // Function to handle the submission of the order details
  void userTappedSubmit() async {
    if (formKey.currentState!.validate()) {
      // Prepare order data
      Map<String, dynamic> orderData = {
        'name': name,
        'address': address,
        'phoneNumber': phoneNumber,
        'city': city,
        'pin': pin,
        'totalAmount': cartController.totalAmount,
        'timestamp': FieldValue.serverTimestamp(), // Add server timestamp
      };

      // Show confirmation dialog
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Confirm Order'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text('Name: $name'),
                Text('Address: $address'),
                Text('Phone Number: $phoneNumber'),
                Text('City: $city'),
                Text('Pin: $pin'),
                Text('Total Price: \$${cartController.totalAmount}'), // Show total price
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () async {
                Navigator.pop(context); // Close the dialog
                await addOrderToFirestore(orderData); // Add order to Firestore
                Get.offAll(() => const HomePage()); // Redirect to homepage
              },
              child: const Text('Confirm Order'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Order Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(labelText: 'Name'),
                    onChanged: (value) => setState(() => name = value),
                    validator: (value) => value!.isEmpty ? 'Enter your name' : null,
                  ),
                  TextFormField(
                    controller: addressController,
                    decoration: const InputDecoration(labelText: 'Address'),
                    onChanged: (value) => setState(() => address = value),
                    validator: (value) => value!.isEmpty ? 'Enter your address' : null,
                  ),
                  TextFormField(
                    controller: phoneController,
                    decoration: const InputDecoration(labelText: 'Phone Number'),
                    keyboardType: TextInputType.phone,
                    onChanged: (value) => setState(() => phoneNumber = value),
                    validator: (value) => value!.isEmpty ? 'Enter your phone number' : null,
                  ),
                  TextFormField(
                    controller: cityController,
                    decoration: const InputDecoration(labelText: 'City'),
                    onChanged: (value) => setState(() => city = value),
                    validator: (value) => value!.isEmpty ? 'Enter your city' : null,
                  ),
                  TextFormField(
                    controller: pincodeController,
                    decoration: const InputDecoration(labelText: 'Pin Code'),
                    keyboardType: TextInputType.number,
                    onChanged: (value) => setState(() => pin = value),
                    validator: (value) => value!.isEmpty ? 'Enter your pin code' : null,
                  ),
                ],
              ),
            ),
            const Spacer(),
            Text('Total Price: \$${cartController.totalAmount}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: ElevatedButton(
                  onPressed: userTappedSubmit, // Call the function to submit order
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
                  ),
                  child: const Text(
                    "Submit Order",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
