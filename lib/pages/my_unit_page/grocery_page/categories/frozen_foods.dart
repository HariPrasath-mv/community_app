import 'package:flutter/material.dart';

class FrozenFoodsPage extends StatelessWidget {
  const FrozenFoodsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Frozen Foods'),
        backgroundColor: const Color(0xFF101935),
      ),
      body: const Center(
        child: Text(
          'List of Frozen Foods',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}