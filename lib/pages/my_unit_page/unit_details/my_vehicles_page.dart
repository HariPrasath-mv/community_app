import 'package:flutter/material.dart';

class MyVehiclesPage extends StatelessWidget {
  const MyVehiclesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Vehicles'),
      backgroundColor: const Color(0xFF101935),
      ),
      body: const Center(child: Text('Details about My Vehicles')),
    );
  }
}
