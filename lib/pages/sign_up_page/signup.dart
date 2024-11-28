import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:flutter_project_1/widgets/colors.dart'; // Import the AppColors class from main.dart
import 'package:flutter_project_1/pages/otp_verification_page/otp_verification_page.dart'; // Import the AppColors class from main.dart

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor1,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Space for the SVG image
              // Reduced the gap to make the back icon visually aligned

              // Back Button
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon:
                      const Icon(Icons.arrow_back, color: AppColors.iconColor1),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),

              // Center(
              //   child: SvgPicture.asset(
              //     'assets/icons/sign_up/signup_image.svg', // Add the SVG file to your assets folder
              //     height: 150, // Adjust the height as needed
              //     width: 200, // Adjust the width as needed
              //   ),
              // ),

              const SizedBox(height: 50),

              Text(
                'Sign Up',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: AppColors.fontColor3,
                    ),
              ),
              const SizedBox(height: 20),
              const Text(
                  "Create an account",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              const SizedBox(height: 20),

              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: const TextStyle(color: AppColors.fontColor5),
                  border: const OutlineInputBorder(),
                  prefixIcon:
                      const Icon(Icons.person, color: AppColors.iconColor1),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a username';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email-ID',
                  labelStyle: const TextStyle(color: AppColors.fontColor5),
                  border: const OutlineInputBorder(),
                  prefixIcon:
                      const Icon(Icons.email, color: AppColors.iconColor1),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              IntlPhoneField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Mobile Number',
                  labelStyle: const TextStyle(color: AppColors.fontColor5),
                  border: const OutlineInputBorder(),
                  prefixIcon:
                      const Icon(Icons.phone, color: AppColors.iconColor1),
                  counterText: '',
                ),
                initialCountryCode: 'IN',
                validator: (phone) {
                  if (phone == null || phone.number.isEmpty) {
                    return 'Please enter your mobile number';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: const TextStyle(color: AppColors.fontColor5),
                  border: const OutlineInputBorder(),
                  prefixIcon:
                      const Icon(Icons.lock, color: AppColors.iconColor1),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              TextFormField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  labelStyle: const TextStyle(color: AppColors.fontColor5),
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.lock_outline,
                      color: AppColors.iconColor1),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  }
                  if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OTPVerificationPage()),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: AppColors.btnColor1,
                ),
                child: const Text('Sign Up',
                    style:
                        TextStyle(fontSize: 18, color: AppColors.fontColor1)),
              ),

              const SizedBox(height: 20),

              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: const Text(
                    'Already have an account? Log in',
                    style: TextStyle(fontSize: 16, color: AppColors.fontColor3),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
