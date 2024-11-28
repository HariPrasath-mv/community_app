import 'package:flutter/material.dart';
import 'package:flutter_project_1/pages/otp_verification_page/otp_verification_page.dart';
import 'package:flutter_project_1/pages/my_unit_page/bill_payments/bill_payment_page.dart';
import 'pages/onboarding_page.dart';
import 'pages/login_page/login.dart';
import 'pages/login_page/forgot_password.dart'; 
import 'pages/sign_up_page/signup.dart';
import 'pages/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Urbanist',
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
          bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
        ),
      ),
      home: const OnboardingPage(), // Start with the Onboarding page
      routes: {
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignupPage(),
        '/forgot_password': (context) => const ForgotPasswordPage(),
        '/otp': (context) => const OTPVerificationPage(),
        '/main': (context) => const MainScreen(),
        '/billPaymentPage': (context) => const BillPaymentPage(),
      },
    );
  }
}