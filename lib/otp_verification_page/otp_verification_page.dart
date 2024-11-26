import 'package:flutter/material.dart';
import 'dart:async';
import '../welcome_page.dart'; // Import the WelcomePage
import 'package:flutter_project_1/colors.dart';

class OTPVerificationPage extends StatefulWidget {
  const OTPVerificationPage({super.key});

  @override
  _OTPVerificationPageState createState() => _OTPVerificationPageState();
}

class _OTPVerificationPageState extends State<OTPVerificationPage> {
  int _seconds = 28;
  Timer? _timer;
  String? _errorMessage;
  final List<TextEditingController> _otpControllers = List.generate(4, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());
  final String _correctOtp = "1234"; // Assume this is the correct OTP for testing

  @override
  void initState() {
    super.initState();
    _startTimer();
    // Request focus for the first input field
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNodes[0].requestFocus();
    });
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0) {
          _seconds--;
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _resendOTP() {
    setState(() {
      _seconds = 28;
      _startTimer();
    });
  }

  void _verifyOtp() {
    String enteredOtp = _otpControllers.map((controller) => controller.text).join();
    if (enteredOtp == _correctOtp) {
      // If OTP is correct, navigate to Welcome Page
      setState(() {
        _errorMessage = null;
      });
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const WelcomePage()),
        );
      });
    } else {
      // If OTP is incorrect, show error message
      setState(() {
        _errorMessage = "OTP is incorrect, try again";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor1,
      appBar: AppBar(
        title: const Text('OTP Verification'),
        backgroundColor: AppColors.appbarColor1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'OTP Verification',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text('Enter the verification code we just sent to your phone number.'),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _otpControllers.asMap().entries.map((entry) {
                int idx = entry.key;
                TextEditingController controller = entry.value;
                return _buildOTPField(controller, _focusNodes[idx], idx);
              }).toList(),
            ),
            if (_errorMessage != null) ...[
              const SizedBox(height: 8),
              Text(
                _errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
            ],
            const SizedBox(height: 16),
            Text(
              _seconds > 0 ? 'Resend OTP in $_seconds s' : '',
              style: const TextStyle(color: Colors.grey),
            ),
            TextButton(
              onPressed: _seconds == 0 ? _resendOTP : null,
              child: Text(
                'Resend OTP',
                style: TextStyle(
                  color: _seconds == 0 ? Colors.blue : Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOTPField(TextEditingController controller, FocusNode focusNode, int idx) {
    return SizedBox(
      width: 50,
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF004395)
            )
          ),
          counterText: '', // Remove the 0/1 indicator
        ),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        onChanged: (value) {
          if (value.isNotEmpty && idx < _otpControllers.length - 1) {
            FocusScope.of(context).nextFocus();
          } else if (value.isEmpty && idx > 0) {
            FocusScope.of(context).previousFocus();
          }
          // Check if all fields are filled
          if (_otpControllers.every((controller) => controller.text.isNotEmpty)) {
            _verifyOtp();
          }
        },
      ),
    );
  }
}
