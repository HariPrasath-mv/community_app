import 'package:flutter/material.dart';
import 'onboarding_page.dart';
import 'login_page/login.dart';
import 'login_page/forgot_password.dart'; 
import 'sign_up_page/signup.dart';
import 'pages/home_page/home_page.dart';
import 'pages/my_unit_page/my_unit_page.dart';
import 'pages/my_community_page/my_community_page.dart';
import 'pages/buy_sell_page/buy_sell_page.dart';
import 'pages/consumer_service_page/consumer_service_page.dart';

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
        '/login': (context) => const LoginPage(), // Login screen
        '/signup': (context) => const SignupPage(), // Signup screen
        '/forgot_password': (context) =>
            const ForgotPasswordPage(), // Forgot Password screen
        '/main': (context) => const HomePage(), // Main app screen
      },
    );
  }
}

// Centralized color definitions


// Main app screen with bottom navigation
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const MyUnitPage(),
    const MyCommunityPage(),
    BuySellPage(),
    const ConsumerServicePage(),
  ];

  final List<String> _titles = [
    "Home",
    "My Unit",
    "My Community",
    "Buy/Sell",
    "Services",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_currentIndex]),
        backgroundColor: AppColors.appbarColor,
        foregroundColor: AppColors.appbariconColor,
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.appColor,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.apartment), label: "My Unit"),
          BottomNavigationBarItem(
              icon: Icon(Icons.people), label: "My Community"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Buy/Sell"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Services"),
        ],
      ),
    );
  }
}

class AppColors {
  static const Color backgroundColor = Color(0xFFFFFFFF); // White background
  static const Color appbarColor = Color.fromARGB(255, 255, 255, 255); // Deep blue
  static const Color appColor = Color(0xFF004395); // Accent blue
  static const Color iconColor = Color(0xFF004395); // Icon blue
  static const Color appbariconColor = Color(0xFFFFFFFF); // White for app bar icons
  static const Color appbariconColor2 = Color(0xFF000000); // black for app bar icons
  static const Color fontColor = Color(0xFF004395); // Dark font color
  static const Color btnColor1 = Color(0xFF004395); // Dark font color
  static const Color fontColor2 = Color(0xFFFFFFFF); // Dark font color
}

class BRadius{
  static const BorderRadius btnborder = BorderRadius.all(Radius.circular(50.0));

}
