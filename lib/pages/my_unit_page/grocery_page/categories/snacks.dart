import 'package:flutter/material.dart';

class SnacksPage extends StatelessWidget {
  const SnacksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snacks'),
        backgroundColor: const Color(0xFF101935),
      ),
      body: const Center(
        child: Text(
          'List of Snacks',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
} 