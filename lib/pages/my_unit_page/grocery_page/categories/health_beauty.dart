import 'package:flutter/material.dart';

class HealthBeautyPage extends StatelessWidget {
  const HealthBeautyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Health & Beauty'),
        backgroundColor: const Color(0xFF101935),
      ),
      body: const Center(
        child: Text(
          'List of Health & Beauty Products',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}