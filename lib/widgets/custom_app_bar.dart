import 'package:flutter/material.dart';
import 'package:flutter_project_1/widgets/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showProfile;
  final VoidCallback? onProfileTap;
  final VoidCallback? onNotificationTap;
  final VoidCallback? onPopupTap;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showProfile = true,
    this.onProfileTap,
    this.onNotificationTap,
    this.onPopupTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.appbarColor1,
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Urbanist',
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: AppColors.fontColor2,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.star, 
          color: AppColors.iconColor1),
          onPressed: onPopupTap,
        ),
        IconButton(
          icon: const Icon(Icons.notifications, color: AppColors.iconColor1),
          onPressed: onNotificationTap,
        ),
        if (showProfile)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: onProfileTap,
              child: const CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://2.img-dpreview.com/files/p/E~C1000x0S4000x4000T1200x1200~articles/3925134721/0266554465.jpeg', // Replace with your image URL
                ),
              ),
            ),
          ),
      ],
    );
  }

  

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
