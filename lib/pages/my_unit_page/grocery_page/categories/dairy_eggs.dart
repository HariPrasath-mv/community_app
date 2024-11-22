import 'package:flutter/material.dart';

class DairyEggsPage extends StatelessWidget {
  const DairyEggsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dairy & Eggs'),
        backgroundColor: const Color(0xFF101935),
      ),
      body: const Center(
        child: Text(
          'List of Dairy Products and Eggs',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}