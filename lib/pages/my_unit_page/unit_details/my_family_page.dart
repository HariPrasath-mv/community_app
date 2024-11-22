import 'package:flutter/material.dart';

class MyFamilyPage extends StatelessWidget {
  const MyFamilyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Family'),
        backgroundColor: const Color(0xFF101935),
      ),
      body: const Center(child: Text('Details about My Family')),
    );
  }
}
