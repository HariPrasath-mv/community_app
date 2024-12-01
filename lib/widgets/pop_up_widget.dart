import 'package:flutter/material.dart';
import 'package:flutter_project_1/widgets/colors.dart';

class PopupMenuWidget extends StatefulWidget {
  const PopupMenuWidget({super.key});

  @override
  _PopupMenuWidgetState createState() => _PopupMenuWidgetState();
}

class _PopupMenuWidgetState extends State<PopupMenuWidget>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize AnimationController for fade-in effect
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    )..forward(); // Start the fade-in animation immediately

    // Define the fade animation (start from transparent to fully visible)
    _fadeAnimation = Tween<double>(
      begin: 0.0, // Fully transparent
      end: 1.0, // Fully visible
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn, // Easing for a smooth fade-in
    ));
  }

  @override
  void dispose() {
    _animationController.dispose(); // Dispose the controller
    super.dispose();
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
    return FadeTransition(
      opacity: _fadeAnimation, // Apply the fade-in animation
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundColor1,
          borderRadius: BorderRadius.circular(22), // Smooth rounded corners
        ),
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
                _buildGridItem(context, Icons.build_outlined, 'Request Service',
                    '/services'),
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
      ),
    );
  }
}
