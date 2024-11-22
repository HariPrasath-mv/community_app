import 'package:flutter/material.dart';

class BabyProductsPage extends StatelessWidget {
  const BabyProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Baby Products'),
        backgroundColor: const Color(0xFF101935),
      ),
      body: const Center(
        child: Text(
          'List of Baby Products',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}