import 'package:flutter/material.dart';

class MyPetsPage extends StatelessWidget {
  const MyPetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Pets'),
        backgroundColor: const Color(0xFF101935),
      ),
      body: const Center(child: Text('Details about My Pets')),
    );
  }
}
