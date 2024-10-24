// import 'dart:math';
// import 'package:mailer/mailer.dart';
// import 'package:mailer/smtp_server.dart';
//
// class OtpController {
//   String generatedOtp = '';
//
//   // Method to generate a 6-digit OTP
//   String generateOtp() {
//     final random = Random();
//     generatedOtp = (100000 + random.nextInt(900000)).toString();
//     return generatedOtp;
//   }
//
//   // Method to send OTP via Gmail
//   Future<void> sendOtp(String email) async {
//     String otp = generateOtp();
//
//     // SMTP server settings
//     String username = 'your-email@gmail.com';
//     String password = 'your-app-password';
//
//     final smtpServer = gmail(username, password);
//
//     // Create the email message
//     final message = Message()
//       ..from = Address(username, 'Your App Name')
//       ..recipients.add(email)
//       ..subject = 'Your OTP Code'
//       ..text = 'Your OTP code is: $otp';
//
//     try {
//       final sendReport = await send(message, smtpServer);
//       print('Message sent: ' + sendReport.toString());
//     } on MailerException catch (e) {
//       print('Message not sent. \n' + e.toString());
//     }
//   }
//
//   // Method to validate the OTP
//   bool validateOtp(String inputOtp) {
//     return inputOtp == generatedOtp;
//   }
// }
// // TODO Implement this library.


//empty can dumped