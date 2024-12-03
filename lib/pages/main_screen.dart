import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_project_1/widgets/colors.dart';
import 'home_page/home_page.dart';
import 'my_unit_page/my_unit_page.dart';
import 'my_community_page/my_community_page.dart';
import 'discover_page/discover_page.dart';
import 'consumer_service_page/service_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    const MyUnitPage(),
    const MyCommunityPage(),
    DiscoverPage(),
    ServicesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: _CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class _CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const _CustomBottomNavigationBar({
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF6FCFF),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500,
            offset: Offset(4.0, 4.0),
            blurRadius: 10,
            spreadRadius: 1.0,
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(-4.0, -4.0),
            blurRadius: 10,
            spreadRadius: 1.0,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            iconPath: 'assets/icons/home_page/home.svg',
            label: 'Home',
            index: 0,
          ),
          _buildNavItem(
            iconPath: 'assets/icons/home_page/my_unit.svg',
            label: 'My Unit',
            index: 1,
          ),
          _buildNavItem(
            iconPath: 'assets/icons/home_page/my_community.svg',
            label: 'My Community',
            index: 2,
          ),
          _buildNavItem(
            iconPath: 'assets/icons/home_page/discover.svg',
            label: 'Discover',
            index: 3,
          ),
          _buildNavItem(
            iconPath: 'assets/icons/home_page/services.svg',
            label: 'Services',
            index: 4,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required String iconPath,
    required String label,
    required int index,
  }) {
    final isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: isSelected
                ? BoxDecoration(
                    color: AppColors.color1.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(16),
                  )
                : null,
            child: SvgPicture.asset(
              iconPath,
              width: 24,
              height: 24,
              color: isSelected ? AppColors.iconColor2 : Colors.grey,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isSelected ? AppColors.iconColor2 : Colors.grey,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
