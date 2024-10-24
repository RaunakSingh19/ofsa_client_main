// import 'package:flutter/material.dart';
// class RazorpayPage extends StatefulWidget {
//   @override
//   _RazorpayPageState createState() => _RazorpayPageState();
// }
// class _RazorpayPageState extends State<RazorpayPage> {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
//   final _formKey = GlobalKey<FormState>();
//   String _cardNumber = '';
//   String _expiryDate = '';
//   String _cvv = '';
//   String _name = '';
//   late String _cardHolderName;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   @override
//   Widget build(BuildContext context) {
//     // Fetch the passed amount from CartPage
//     final double amount = Get.arguments['amount'];
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Online Payment',
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//             fontSize: 26,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.transparent,
//       ),
//       body: RefreshIndicator(
//         onRefresh: _refreshPage, // Adds refresh functionality
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: ListView(
//             children: [
//               Text(
//                 'Payment Details',
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 30),
//               // CreditCardForm(
//               //   formKey: _formKey,
//               //   // onCreditCardModelChange: onCreditCardModelChange,
//               //   obscureCvv: true,
//               //   obscureNumber: false,
//               //   cardNumber: _cardNumber,
//               //   expiryDate: _expiryDate,
//               //   cardHolderName: _cardHolderName,
//               //   cvvCode: _cvv,
//               // ),
//               SizedBox(height: 30),
//               Form(
//                 key: _formKey,
//                 child: Column(
//                   children: [
//                     TextFormField(
//                       decoration: InputDecoration(
//                         labelText: 'Name on Card',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12), // Rounded edges
//                         ),
//                       ),
//                       onChanged: (value) => _name = value,
//                       validator: (value) => value!.isEmpty ? 'Enter name' : null,
//                       initialValue: _name,
//                     ),
//                     SizedBox(height: 20),
//                     TextFormField(
//                       decoration: InputDecoration(
//                         labelText: 'Card Number',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12), // Rounded edges
//                         ),
//                       ),
//                       keyboardType: TextInputType.number,
//                       onChanged: (value) => _cardNumber = value,
//                       validator: (value) => value!.isEmpty ? 'Enter card number' : null,
//                       initialValue: _cardNumber,
//                     ),
//                     SizedBox(height: 20),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: TextFormField(
//                             decoration: InputDecoration(
//                               labelText: 'Expiry Date (MM/YY)',
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(12), // Rounded edges
//                               ),
//                             ),
//                             keyboardType: TextInputType.datetime,
//                             onChanged: (value) => _expiryDate = value,
//                             validator: (value) => value!.isEmpty ? 'Enter expiry date' : null,
//                             initialValue: _expiryDate,
//                           ),
//                         ),
//                         SizedBox(width: 20),
//                         Expanded(
//                           child: TextFormField(
//                             decoration: InputDecoration(
//                               labelText: 'CVV',
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(12), // Rounded edges
//                               ),
//                             ),
//                             keyboardType: TextInputType.number,
//                             obscureText: true,
//                             onChanged: (value) => _cvv = value,
//                             validator: (value) => value!.isEmpty ? 'Enter CVV' : null,
//                             initialValue: _cvv,
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 30),
//                     Text(
//                       'Amount to be deducted: ₹$amount',
//                       style: TextStyle(fontSize: 20),
//                     ),
//                     SizedBox(height: 20),
//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.indigo, // Set the button color
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12), // Rounded edges
//
//                         ),
//                       ),
//                       onPressed: () {
//                         if (_formKey.currentState!.validate()) {
//                           _simulatePayment(amount);
//                         }
//                         // Get.to(() => PaymentSuccessPage());
//                       },
//                       child: Text(
//                         'Pay Now',
//                         style: TextStyle(color: Colors.white),
//
//                       ),
//
//                     ),
//
//                   ],
//                 ),
//               ),// can copy for the form
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Simulate a payment process and redirect to the PaymentSuccessPage
//   Future<void> _simulatePayment(double amount) async {
//     await Future.delayed(Duration(seconds: 2), () async {
//       String orderId = _generateOrderId(); // Generate Order ID
//
//       // Save order details to Firebase
//       await _saveOrderDetails(orderId, amount);
//
//       // Redirect to the PaymentSuccessPage
//       //  Get.to(() => PaymentSuccessPage()),
//       //   orderId: orderId, // just remove the order id part and see if the code works
//       //   totalAmount: amount,
//       // ));
//     });
//   }
//
//   // Refresh the form inputs
//   Future<void> _refreshPage() async {
//     await Future.delayed(Duration(seconds: 1), () {
//       setState(() {
//         _cardNumber = '';
//         _expiryDate = '';
//         _cvv = '';
//         _name = '';
//       });
//     });
//   }
//
//   // Generate unique order ID
//   String _generateOrderId() {
//     return "ORD${DateTime.now().millisecondsSinceEpoch}";
//   }
//
//   // Save order details to Firebase
//   Future<void> _saveOrderDetails(String orderId, double amount) async {
//     final userId = 'USER_ID'; // Replace this with actual user ID fetching logic
//     final cartItems = Get.find<PurchaseController>().cartItems;
//
//     final userDetails = {
//       'orderId': orderId,
//       'userId': userId,
//       'amount': amount,
//       'date': DateTime.now(),
//       'items': cartItems.map((item) => {
//         'name': item.name,
//         'price': item.price,
//         'quantity': item.quantity,
//       }).toList(),
//     };
//
//     await _firestore.collection('orders').doc(orderId).set(userDetails);
//   }
//   // void onCreditCardModelChange(CreditCardModel creditCardModel) {
//   //   setState(() {
//   //     _cardNumber = creditCardModel.cardNumber;
//   //     _expiryDate = creditCardModel.expiryDate;
//   //     _cardHolderName = creditCardModel.cardHolderName;
//   //     var cvvCode = creditCardModel.cvvCode;
//   //     var isCvvFocused = creditCardModel.isCvvFocused;
//   //   });
//   // }
//
// }
