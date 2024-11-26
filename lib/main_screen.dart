import 'package:flutter/material.dart';
import 'package:flutter_project_1/colors.dart';
import 'pages/home_page/home_page.dart';
import 'pages/my_unit_page/my_unit_page.dart';
import 'pages/my_community_page/my_community_page.dart';
import 'pages/discover_page/discover_page.dart';
import 'pages/consumer_service_page/consumer_service_page.dart';

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
    DiscoverPage(),
    const ConsumerServicePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        selectedItemColor: AppColors.iconColor1,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.apartment), label: "My Unit"),
          BottomNavigationBarItem(
              icon: Icon(Icons.people), label: "My Community"),
          BottomNavigationBarItem(
              icon: Icon(Icons.public), label: "Discover"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Services"),
        ],
      ),
    );
  }
}