import 'package:flutter/material.dart';
import 'package:flutter_project_1/widgets/colors.dart';
import 'package:flutter_project_1/widgets/custom_app_bar.dart';
import 'package:flutter_project_1/widgets/ad_carousel.dart';
import 'package:flutter_project_1/pages/Profile_page/profile_page.dart';
import 'package:flutter_project_1/pages/home_page/notification_page.dart';
import 'package:flutter_project_1/widgets/dues_option.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Navigate to Profile Page
  void _navigateToProfile(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProfilePage()),
    );
  }

  // Navigate to Notifications Page
  void _navigateToNotifications(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NotificationPage()),
    );
  }

  // Show Quick Access Popup Menu
  void _showPopupMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: AppColors.backgroundColor1,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                'Quick Access',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                children: [
                  _buildGridItem(
                      context, Icons.account_circle, 'My Profile', '/profile'),
                  _buildGridItem(context, Icons.wallet, 'My Dues', '/dues'),
                  _buildGridItem(
                      context, Icons.people, 'Add Visitors', '/visitors'),
                  _buildGridItem(context, Icons.shield_outlined, 'GateKeeper',
                      '/gatekeeper'),
                  _buildGridItem(context, Icons.build_outlined,
                      'Request Service', '/services'),
                  _buildGridItem(
                      context, Icons.schedule, 'Schedule', '/schedule'),
                  _buildGridItem(
                      context, Icons.analytics, 'Insights', '/insights'),
                  _buildGridItem(
                      context, Icons.settings, 'Settings', '/settings'),
                  _buildGridItem(context, Icons.help_outline, 'Help', '/help'),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  // Build Individual Quick Access Menu Item
  Widget _buildGridItem(
      BuildContext context, IconData icon, String label, String route) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context); // Close the bottom sheet on tap
        Navigator.pushNamed(context, route); // Navigate to the respective route
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: AppColors.appbariconColor1),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(fontSize: 14, color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor1,
      appBar: CustomAppBar(
        title: 'Welcome, User!',
        onProfileTap: () => _navigateToProfile(context),
        onNotificationTap: () => _navigateToNotifications(context),
        onPopupTap: () => _showPopupMenu(context),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            // Ad Carousel Section
            AdsCarousel(),
            SizedBox(height: 20),
            
            // Dues Section
            DuesOption(
              title: 'Dues',
              amount: '₹ 65.00',
              icon: Icons.account_balance_wallet,
              color: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }
}
