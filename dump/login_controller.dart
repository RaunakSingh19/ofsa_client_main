// // import 'dart:math';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:ofsa_client_main/models/user/user.dart';
// // import 'package:otp_text_field_v2/otp_field_v2.dart';
// //
// // class LoginController extends GetxController{
// //   FirebaseFirestore firestore=FirebaseFirestore.instance;
// //   late CollectionReference userCollection;
// //
// //   TextEditingController registerNameCtrl = TextEditingController();
// //   TextEditingController registerNumberCtrl = TextEditingController();
// //   OtpFieldControllerV2 otpController = OtpFieldControllerV2();
// //   bool otpFieldShow=false;
// //   int? otpSend;
// //   int? otpEntered;
// //
// //   @override
// //   void onInit() {
// //     userCollection=firestore.collection('users');
// //     super.onInit();
// //   }
// //
// //   Future<void> addUser() async {
// //     try {
// //       if(otpSend ==otpEntered){
// //         DocumentReference doc = userCollection.doc();
// //         User user = User(
// //           id: doc.id,
// //           name: registerNameCtrl.text,
// //           number: int.parse(registerNumberCtrl.text),
// //         );
// //         final userJson = user.toJson();
// //         doc.set(userJson);
// //         Get.snackbar('Success', 'User add successfully ',colorText: Colors.green);
// //         registerNumberCtrl.clear();
// //         registerNameCtrl.clear();
// //         otpController.clear();
// //       }else{
// //         Get.snackbar('Error', e.toString(),colorText: Colors.red);
// //       }
// //
// //       }catch(e){
// //       Get.snackbar('Error', 'Otp is incorrect ',colorText: Colors.red);
// //       print(e);
// //     }
// //   }
// //   sendOtp() {
// //     try {
// //       if(registerNameCtrl.text.isEmpty || registerNumberCtrl.text.isEmpty){
// //         Get.snackbar('Error', 'Please Fill the empty field ',colorText: Colors.red);
// //         return;
// //       }
// //       final random = Random();
// //       int otp = 1000 + random.nextInt(9000); // Generates a random number between 1000 and 9999
// //       print(otp); // You can send this OTP to the user via SMS or any other method
// //       //? will send otp and check its send successfully or not
// //       if(otp !=null){
// //             otpFieldShow =true;
// //             otpSend=otp;
// //             Get.snackbar('Success', 'Otp send  Successfully!! ',colorText: Colors.green);
// //
// //           }else{
// //             Get.snackbar('Error', 'Otp Not send !! ',colorText: Colors.red);
// //           }
// //     } catch (e) {
// //       print(e);
// //     }finally{
// //       update();
// //     }
// //   }
// //
// // }
//
// import 'dart:math';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:ofsa_client_main/models/user/user.dart';
// import 'package:otp_text_field_v2/otp_field_v2.dart';
// import 'package:ofsa_client_main/services/email_service.dart';  // Custom service for sending email
//
// class LoginController extends GetxController {
//   FirebaseFirestore firestore = FirebaseFirestore.instance;
//   late CollectionReference userCollection;
//
//   TextEditingController registerNameCtrl = TextEditingController();
//   TextEditingController registerEmailCtrl = TextEditingController(); // Updated to use Email
//   OtpFieldControllerV2 otpController = OtpFieldControllerV2();
//   bool otpFieldShow = false;
//   String? otpSend;
//   String? otpEntered;
//
//   @override
//   void onInit() {
//     userCollection = firestore.collection('users');
//     super.onInit();
//   }
//
//   Future<void> addUser() async {
//     try {
//       if (otpSend == otpEntered) {
//         DocumentReference doc = userCollection.doc();
//         User user = User(
//           id: doc.id,
//           name: registerNameCtrl.text,
//           email: registerEmailCtrl.text,  // Updated to use Email
//         );
//         final userJson = user.toJson();
//         await doc.set(userJson);
//         Get.snackbar('Success', 'User added successfully', colorText: Colors.green);
//         registerEmailCtrl.clear();
//         registerNameCtrl.clear();
//         otpController.clear();
//       } else {
//         Get.snackbar('Error', 'OTP is incorrect', colorText: Colors.red);
//       }
//     } catch (e) {
//       Get.snackbar('Error', e.toString(), colorText: Colors.red);
//       print(e);
//     }
//   }
//
//   Future<void> sendOtp() async {
//     try {
//       if (registerNameCtrl.text.isEmpty || registerEmailCtrl.text.isEmpty) {
//         Get.snackbar('Error', 'Please fill in all fields', colorText: Colors.red);
//         return;
//       }
//
//       final random = Random();
//       String otp = (1000 + random.nextInt(9000)).toString(); // Generate a random 4-digit OTP
//       otpSend = otp;
//
//       bool emailSent = await EmailService.sendOtpToEmail(
//         email: registerEmailCtrl.text,
//         otp: otp,
//       );
//
//       if (emailSent) {
//         otpFieldShow = true;
//         Get.snackbar('Success', 'OTP sent successfully!', colorText: Colors.green);
//       } else {
//         Get.snackbar('Error', 'Failed to send OTP', colorText: Colors.red);
//       }
//     } catch (e) {
//       print(e);
//       Get.snackbar('Error', 'Failed to send OTP', colorText: Colors.red);
//     } finally {
//       update();
//     }
//   }
// }


//empty can dump