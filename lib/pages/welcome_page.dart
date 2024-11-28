import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_project_1/widgets/colors.dart';
import 'main_screen.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _imageSlideAnimation;
  late Animation<Offset> _textSlideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize Animation Controller
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    );

    // Slide animation for the image
    _imageSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2), // Start above the screen
      end: Offset.zero, // Slide to its original position
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    // Slide animation for the text
    _textSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5), // Start below the screen
      end: Offset.zero, // Slide to its original position
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    // Fade animation for button
    _fadeAnimation = Tween<double>(
      begin: 0, // Start invisible
      end: 1, // Fully visible
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );

    // Start the animation
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Add space above the image
              const SizedBox(height: 50),

              // Animated SVG Image (covers 40% of the page height)
              Expanded(
                flex: 4,
                child: SlideTransition(
                  position: _imageSlideAnimation,
                  child: SvgPicture.asset(
                    'assets/images/welcome_image.svg', // Add your SVG file to the assets folder
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Welcome Text with animation
              SlideTransition(
                position: _textSlideAnimation,
                child: Column(
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Welcome to the App!',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'You have successfully signed up and verified your OTP.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),

              // Continue Button with minimal animation
              FadeTransition(
                opacity: _fadeAnimation,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainScreen()),
                    );
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                    padding: const EdgeInsets.symmetric(
                        vertical: 14, horizontal: 60),
                    decoration: BoxDecoration(
                      color: AppColors.btnColor1,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Text(
                      'Continue',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 100),
            ],
          );
        },
      ),
    );
  }
}
