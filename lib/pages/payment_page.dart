import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:get/get.dart';
// import '../../dump/orders/dilivery_progress_page.dart';
import 'package:ofsa_client_main/pages/home_page.dart';
// import '../../dump/cart_controller.dart';
import '../controller/home_controller.dart';
import '../controller/purchase_controller.dart';
import '../widgets/my_button.dart';
import '../widgets/pay_button.dart';
import 'order_details_form.dart'; // Import your custom button

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  void userTappedPay() {
    if (formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Confirm Payment'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text('Card Number: $cardNumber'),
                Text('Expiry Date: $expiryDate'),
                Text('Card Holder Name: $cardHolderName'),
                Text('CVV Code: $cvvCode'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Close the dialog and go back to the homepage
                Navigator.pop(context);
                // Refresh the homepage after navigating back
                HomeController homeController = Get.find();
                // PurchaseController.refreshHomePage(); // Trigger homepage refresh
                Get.offAll(() => HomePage()); // Go back to the homepage
              },
              child: const Text('Back to Homepage'),
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
        title: const Text('Checkout'),
      ),
      body: Column(
        children: [
          CreditCardWidget(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            showBackView: isCvvFocused,
            onCreditCardWidgetChange: (p0) {},
          ),
          CreditCardForm(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            onCreditCardModelChange: (data) {
              setState(() {
                cardNumber = data.cardNumber;
                expiryDate = data.expiryDate;
                cardHolderName = data.cardHolderName;
                cvvCode = data.cvvCode;
              });
            },
            formKey: formKey,
          ),
          const Spacer(),
          PayButton(
            onTap: () {
              // Use GetX to navigate to the Order Details Page
              Get.to(() => const OrderDetailsPage());
            },
            text: 'Proceed',
          ),
        ],
      ),
    );
  }
}