import 'package:flutter/material.dart';
import 'package:flutter_project_1/widgets/announcement_widget.dart';
// import 'package:flutter_project_1/widgets/colors.dart';
import 'package:flutter_project_1/widgets/custom_app_bar.dart';
import 'package:flutter_project_1/widgets/ad_carousel.dart';
import 'package:flutter_project_1/pages/Profile_page/profile_page.dart';
import 'package:flutter_project_1/pages/home_page/notification_page.dart';
import 'package:flutter_project_1/widgets/dues_option.dart';
// import 'package:flutter_project_1/widgets/pop_up_widget.dart';
// import '../../widgets/announcement_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Map<String, String>> _announcements = [
    {
      'title': 'Electric Vehicle Charging',
      'description':
          'Dear Residents, Electric Vehicle Charging Point Installation Guidelines of Resident is r ...',
      'date': '22 May 2022, 12:00 AM',
    },
    {
      'title': 'Inauguration Event',
      'description': 'Please join us for the inauguration ceremony ...',
      'date': '22 May 2022, 12:00 AM',
    },
  ];

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

  // void _showPopupMenu(BuildContext context) {
  //   showModalBottomSheet(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return PopupMenuWidget(); // Show the Popup Menu Widget
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      // backgroundColor: AppColors.backgroundColor1,
      appBar: CustomAppBar(
        title: 'Welcome, User!',
        onProfileTap: () => _navigateToProfile(context),
        onNotificationTap: () => _navigateToNotifications(context),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Ad Carousel Section
            const AdsCarousel(),
            const SizedBox(height: 20),

            // Dues Option Section
            DuesOption(),
            const SizedBox(height: 20),

            AnnouncementWidget(announcements: _announcements),
            
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
