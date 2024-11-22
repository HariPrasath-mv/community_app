import 'package:flutter/material.dart';

class PantryStaplesPage extends StatelessWidget {
  const PantryStaplesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantry Staples'),
        backgroundColor: const Color(0xFF101935),
      ),
      body: const Center(
        child: Text(
          'List of Pantry Staples',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}