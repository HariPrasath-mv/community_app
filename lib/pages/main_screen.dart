import 'package:flutter/material.dart';
import 'package:flutter_project_1/widgets/colors.dart';
import 'package:flutter_project_1/pages/home_page/home_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'my_unit_page/my_unit_page.dart';
import 'my_community_page/my_community_page.dart';
import 'discover_page/discover_page.dart';
// import 'consumer_service_page/consumer_service_page.dart';
import 'consumer_service_page/service_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const MyUnitPage(),
    const MyCommunityPage(),
    DiscoverPage(),
    ServicesPage(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(_titles[_currentIndex]),
      //   automaticallyImplyLeading: false,
      //   backgroundColor: AppColors.iconColor1,
      // ),
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
        selectedItemColor: AppColors.iconColor2,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 24,
              height: 24,
              child: SvgPicture.asset(
                'assets/icons/home_page/home.svg',
                color: _currentIndex == 0 ? AppColors.iconColor2 : Colors.grey,
              ),
            ),
            label: "Home",
            tooltip: "Go to Home",
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 24,
              height: 24,
              child: SvgPicture.asset(
                'assets/icons/home_page/my_unit.svg',
                color: _currentIndex == 1 ? AppColors.iconColor2 : Colors.grey,
              ),
            ),
            label: "My Unit",
            tooltip: "View My Unit",
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 24,
              height: 24,
              child: SvgPicture.asset(
                'assets/icons/home_page/my_community.svg',
                color: _currentIndex == 2 ? AppColors.iconColor2 : Colors.grey,
              ),
            ),
            label: "My Community",
            tooltip: "Explore My Community",
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 24,
              height: 24,
              child: SvgPicture.asset(
                'assets/icons/home_page/discover.svg',
                color: _currentIndex == 3 ? AppColors.iconColor2 : Colors.grey,
              ),
            ),
            label: "Discover",
            tooltip: "Discover New Things",
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 24,
              height: 24,
              child: SvgPicture.asset(
                'assets/icons/home_page/services.svg',
                color: _currentIndex == 4 ? AppColors.iconColor2 : Colors.grey,
              ),
            ),
            label: "Services",
            tooltip: "Access Services",
          ),
        ],
      ),
    );
  }
}
