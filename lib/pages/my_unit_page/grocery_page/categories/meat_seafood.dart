import 'package:flutter/material.dart';

class MeatSeafoodPage extends StatelessWidget {
  const MeatSeafoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meat & Seafood'),
        backgroundColor: const Color(0xFF101935),
      ),
      body: const Center(
        child: Text(
          'List of Meat and Seafood Products',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}