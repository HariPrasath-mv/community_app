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
          icon: const Icon(Icons.notifications, color: AppColors.iconColor1),
          onPressed: onNotificationTap,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
