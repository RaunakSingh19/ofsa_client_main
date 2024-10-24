import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ofsa_client_main/controller/home_controller.dart';
import 'package:ofsa_client_main/pages/cart_page.dart';
import 'package:ofsa_client_main/pages/home_page.dart';
import 'package:ofsa_client_main/pages/login.dart';
import 'package:ofsa_client_main/pages/order_details_form.dart';
import 'package:ofsa_client_main/pages/payment_page.dart';
// import '../dump/razorpay_page.dart';
import 'package:provider/provider.dart';
import 'controller/purchase_controller.dart';
import 'firebase_options.dart';
import 'themes/theme_provider.dart'; // Import the ThemeProvider

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    // Initialize Firebase
    await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
  } catch (e) {
    print("Error initializing Firebase: $e");
  }
  Get.put(HomeController());
  Get.put(PurchaseController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Client App',
            theme: themeProvider.themeData, // Apply the theme dynamically
            home:  LogIn(),
          );
        },
      ),
    );
  }
}
