import 'package:flutter/material.dart';

class BeveragesPage extends StatelessWidget {
  const BeveragesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beverages'),
        backgroundColor: const Color(0xFF101935),
      ),
      body: const Center(
        child: Text(
          'List of Beverages',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}