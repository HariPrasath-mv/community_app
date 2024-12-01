import 'package:flutter/material.dart';
// import 'package:flutter_project_1/widgets/colors.dart';
import 'package:flutter_project_1/widgets/custom_app_bar.dart';
import 'package:flutter_project_1/widgets/ad_carousel.dart';
import 'package:flutter_project_1/pages/Profile_page/profile_page.dart';
import 'package:flutter_project_1/pages/home_page/notification_page.dart';
import 'package:flutter_project_1/widgets/dues_option.dart';
import 'package:flutter_project_1/widgets/pop_up_widget.dart';
import 'package:flutter_project_1/widgets/quick_access.dart';

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

  void _showPopupMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return PopupMenuWidget(); // Show the Popup Menu Widget
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.backgroundColor1,
      appBar: CustomAppBar(
        title: 'Welcome, User!',
        onProfileTap: () => _navigateToProfile(context),
        onNotificationTap: () => _navigateToNotifications(context),
        onPopupTap: () => _showPopupMenu(context),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Ad Carousel Section
            const AdsCarousel(),
            const SizedBox(height: 20),
            // Row to hold Dues Section (70%) and Quick Access Button (30%)
            Row(
              children: [
                Expanded(
                  flex: 7,
                  child: const DuesOption(),
                ),
                const SizedBox(width: 5),
                Expanded(
                  flex: 2,
                  child: QuickAccessButton(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
