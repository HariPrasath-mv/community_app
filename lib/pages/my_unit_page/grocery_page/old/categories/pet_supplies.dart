import 'package:flutter/material.dart';

class PetSuppliesPage extends StatelessWidget {
  const PetSuppliesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pet Supplies')),
      body: ListView(
        children: [
          ListTile(title: Text('Pet Food')),
          ListTile(title: Text('Pet Care Products')),
        ],
      ),
    );
  }
}
