import 'package:flutter/material.dart';

class FruitsVegetablesPage extends StatelessWidget {
  const FruitsVegetablesPage({super.key});

  @override
  Widget build(BuildContext context) {
 return Scaffold(
      appBar: AppBar(
        title: const Text('Fruits & Vegetables'),
        backgroundColor: const Color(0xFF101935),
      ),
      body: const Center(
        child: Text(
          'List of Fresh Fruits and Vegetables',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}