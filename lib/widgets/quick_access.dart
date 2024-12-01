import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import the flutter_svg package
import 'package:flutter_project_1/widgets/colors.dart';

class QuickAccessButton extends StatelessWidget {
  const QuickAccessButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Display a custom popup card in the center of the screen
        _showPopupCard(context);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent, // Transparent background
          shape: BoxShape.circle, // Circular shape
          border: Border.all(
            color: Colors.orange, // Border color same as icon color
            width: 2, // Border width
          ),
        ),
        padding: const EdgeInsets.all(12), // Padding inside the circle
        child: SvgPicture.asset(
          'assets/icons/popup_icons/quick.svg', // SVG file path
          width: 40,
          height: 40,
        ),
      ),
    );
  }

  // Function to show the popup card in the center
  void _showPopupCard(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true, // Allow dismiss by tapping outside
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Card border radius
          ),
          elevation: 5,
          backgroundColor:
              Colors.transparent, // Transparent background to show card
          child: _PopupDialog(), // Custom widget for the dialog content
        );
      },
    );
  }
}

class _PopupDialog extends StatefulWidget {
  @override
  State<_PopupDialog> createState() => _PopupDialogState();
}

class _PopupDialogState extends State<_PopupDialog> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  List<Map<String, dynamic>> options = [
    {'icon': 'assets/icons/popup_icons/profile.svg', 'label': 'My Profile'},
    {'icon': 'assets/icons/popup_icons/dues.svg', 'label': 'My Dues'},
    {'icon': 'assets/icons/popup_icons/people.svg', 'label': 'Add Visitors'},
    {
      'icon': 'assets/icons/popup_icons/gatekeeper.svg',
      'label': 'GateKeeper'
    },
    {
      'icon': 'assets/icons/popup_icons/request_service.svg',
      'label': 'Request Service'
    },
    {'icon': 'assets/icons/popup_icons/schedule.svg', 'label': 'Schedule'},
    {'icon': 'assets/icons/popup_icons/insights.svg', 'label': 'Insights'},
    {'icon': 'assets/icons/popup_icons/settings.svg', 'label': 'Settings'},
    {'icon': 'assets/icons/popup_icons/help.svg', 'label': 'Help'},
  ];

  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 0.9, end: 1).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: Center(
          child: Container(
            width: 320,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildHeader(),
                const SizedBox(height: 20),
                // GridView for options
                GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // Number of columns in the grid
                    crossAxisSpacing: 10, // Spacing between columns
                    mainAxisSpacing: 10, // Spacing between rows
                  ),
                  itemCount: options.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _buildGridItem(index);
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.orange,
                  ),
                  child: const Text('Close'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Build the Header with Edit Button
  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Quick Access',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
          icon: Icon(
            _isEditing ? Icons.done : Icons.edit,
            color: Colors.orange,
          ),
          onPressed: () {
            setState(() {
              _isEditing = !_isEditing;
            });
          },
        ),
      ],
    );
  }

  // Build Individual Quick Access Grid Item with SVG
  Widget _buildGridItem(int index) {
    return GestureDetector(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Main Option
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                options[index]['icon'],
                width: 30,
                height: 30,
                color: AppColors.appbariconColor1,
              ),
              const SizedBox(height: 8),
              Text(
                options[index]['label'],
                style: const TextStyle(fontSize: 12, color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          // Show the delete button in edit mode
          if (_isEditing)
            Positioned(
              right: 0,
              top: 0,
              child: IconButton(
                icon: const Icon(
                  Icons.remove_circle_outline,
                  color: Colors.red,
                  size: 20,
                ),
                onPressed: () {
                  setState(() {
                    options.removeAt(index); // Remove the item from the list
                  });
                },
              ),
            ),
        ],
      ),
    );
  }
}

