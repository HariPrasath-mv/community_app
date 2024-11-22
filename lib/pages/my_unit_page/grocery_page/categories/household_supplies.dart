import 'package:flutter/material.dart';

class HouseholdSuppliesPage extends StatelessWidget {
  const HouseholdSuppliesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Household Supplies'),
        backgroundColor: const Color(0xFF101935),
      ),
      body: const Center(
        child: Text(
          'List of Household Supplies',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}