import 'package:flutter/material.dart';

class PetSuppliesPage extends StatelessWidget {
  const PetSuppliesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Supplies'),
        backgroundColor: const Color(0xFF101935),
      ),
      body: const Center(
        child: Text(
          'List of Pet Supplies',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}