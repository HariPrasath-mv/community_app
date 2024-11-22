import 'package:flutter/material.dart';

class BakeryBreadPage extends StatelessWidget {
  const BakeryBreadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bakery & Bread'),
        backgroundColor: const Color(0xFF101935),
      ),
      body: const Center(
        child: Text(
          'List of Bakery Products and Bread',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}